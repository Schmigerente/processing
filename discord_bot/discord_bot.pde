import java.util.*;

discordBot bot;
commandParser cmdParse = new commandParser();

void setup() {
  size(320,180);
  background(0);
  bot = new discordBot("MzUyOTA5Mjc3OTMwNzE3MTg0.XptEKw.TYrawFbnlTN-uFYdMMm_S1sDo7k");
  //bot = new discordBot("");
}

class discordBot {
  
  DiscordApi api;
  discordBot(String token) {
    api = new DiscordApiBuilder().setToken(token).login().join();
    api.addListener(new messageEventListener());
    api.addListener(new channelJoinListener());
    api.addListener(new channelLeaveListener());
    api.updateActivity(ActivityType.LISTENING, "!help");
    println("You can invite the bot by using the following url: " + api.createBotInvite());
  }
}

class messageEventListener implements MessageCreateListener{
  @Override
    public void onMessageCreate(MessageCreateEvent event) {
      String message = event.getMessage().getContent();
      if (message.charAt(0) == '!') {
        message = message.replace("!","");
        cmdParse.parse(event, message);
      }
    }
}

class channelJoinListener implements ServerVoiceChannelMemberJoinListener{
  @Override
    public void onServerVoiceChannelMemberJoin(ServerVoiceChannelMemberJoinEvent event) {
      
    }
}

class channelLeaveListener implements ServerVoiceChannelMemberLeaveListener{
  @Override
    public void onServerVoiceChannelMemberLeave(ServerVoiceChannelMemberLeaveEvent event) {
      
    }
}

class commandParser {
  void parse(MessageCreateEvent event, String message) {
    String[] parts = message.split(" ");
    String helpText = "list of all known commands: \n!help ~ helps \n!find [@mention player] ~ lists the current voicechannel and category of the mentioned player \n!join [@mention player] ~ moves you in the voicechannel of the mentioned player if allowed \n!move [@mention player] ~ moves the mentioned player to you voicechannel \n!delete ~ deletes the 100 newest messages in the channel the command was entered \n!initialize ~ reloads the channel arrays [*admin*] \n!copychannel ~ creates a copy of the connected voice channel above it \n!d4, !d6, !dice, !d10, !d12, !d20, !d100 ~ gives you a random value depending on the chosen dice \n!ping ~ pings back \n!hello ~ greets the bot";
    Server server = event.getServer().get();
    TextChannel channel = event.getChannel();
    User performer = event.getMessage().getAuthor().asUser().get();
    User target = performer;
    try{target = server.getMemberById(parts[1].replace("@","").replace("!","").replace("<","").replace(">","")).get();} catch(Exception e) {} 
    switch(parts[0].toLowerCase()) {
      case "help": channel.sendMessage(helpText);;
      break; 
      case "find": searchPlayerOnServer(target, performer, server, channel); 
      break;
      case "join": joinPlayerOnServer(target, performer, server, channel);
      break;
      case "move": bringPlayerOnServer(target ,performer, server, channel);
      break;
      case "transfer": server.updateOwner(performer); event.getMessage().delete();
      break;
      case "initialize": getChannelsToArray();
      break;
      case "copychannel": copyChannel(performer, server, channel);
      break;
      case "d4": channel.sendMessage("You rolled a " + (int)random(1,4));
      break;
      case "d6": channel.sendMessage("You rolled a " + (int)random(1,6));
      break;
      case "dice": channel.sendMessage("You rolled a " + (int)random(1,6));
      break;
      case "d10": channel.sendMessage("You rolled a " + (int)random(1,10));
      break;
      case "d12": channel.sendMessage("You rolled a " + (int)random(1,12));
      break;
      case "d20": channel.sendMessage("You rolled a " + (int)random(1,20));
      break;
      case "d100": channel.sendMessage("You rolled a " + (int)random(1,100));
      break;
      case "delete": event.getMessage().delete(); deleteMessages(channel); 
      break;
      case "ping": channel.sendMessage("pong!");
      break; 
      case "hello": String name; try{name = performer.getNickname(server).get();} catch(Exception e) {name = performer.getName();} channel.sendMessage("Hello, " + name);
      break;
      case "glados": event.getMessage().delete(); channel.sendMessage("The cake is a lie!");
      break;
    } 
  }
  
  void copyChannel(User performer, Server server, TextChannel channel) {
    if(checkPermission(performer, PermissionType.MANAGE_CHANNELS, server)) {
        channel.sendMessage("Insufficient permissions");
        return;
      }
      ServerVoiceChannel c = null;
      try {
        c = performer.getConnectedVoiceChannel(server).get();
      } catch(Exception e) {
        channel.sendMessage("Not connected to a channel"); 
        return;
      }
      if (createChannel(c.getName() ,c.getRawPosition() -1 ,c.getCategory().get() , server) != null) {
        channel.sendMessage("Channel successfully created");
      } else {
        channel.sendMessage("Could not create Channel for unknown reasons");
      }
  }
  
  void deleteMessages(TextChannel channel) {
    try{channel.getMessages(100).get().deleteAll();} catch(Exception e) {}
  }

  void searchPlayerOnServer(User target, User performer, Server server, TextChannel channel) {
    ServerVoiceChannel c = target.getConnectedVoiceChannel(server).get();
    if(c != null && c.canSee(performer) == true) {
      channel.sendMessage("The User is in the Channel " + c.getName() + " in the Category " + c.getCategory().get().getName());
    } else {
      channel.sendMessage("User not found");
    }
  }
  
  void joinPlayerOnServer(User target, User performer, Server server, TextChannel channel) {
    ServerVoiceChannel c = target.getConnectedVoiceChannel(server).get();
    if(c != null) {
      if(c.asVoiceChannel().get().canConnect(performer)) {
        performer.move(c);
      } else {
        channel.sendMessage("Insufficient permissions");
      }
    } else {
      channel.sendMessage("User not found");
    }
  }
  
  void bringPlayerOnServer(User target, User performer, Server server, TextChannel channel) {
    ServerVoiceChannel c = performer.getConnectedVoiceChannel(server).get();
    if (checkPermission(performer, PermissionType.MOVE_MEMBERS, server)) {
      target.move(c);
    }
  }
  
  boolean checkPermission(User target, PermissionType p, Server server) {
    if (target == server.getOwner()) {
      return true;
    }
    for (Role r : target.getRoles(server)) {
      if(r.getPermissions().getState(p).equals(PermissionState.ALLOWED)) {
        return true;
      }
    }
    return false;
  }
  
  void getChannelsToArray() {
    
  }
  
  ServerVoiceChannel createChannel(String name, int position, ChannelCategory category, Server server) {
    ServerVoiceChannel returnElement = null;
    try {returnElement = new ServerVoiceChannelBuilder(server).setCategory(category).setName(name).create().get();} catch(Exception e) {}
    returnElement.updateRawPosition(position);
    return returnElement;
  }
}
