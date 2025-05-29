import 'dart:async';

class ChatSocket {
  ChatSocket._();
  StreamController<bool>? socketController;
  static ChatSocket _instance = ChatSocket._();
  // Factory method to access the singleton instance
  factory ChatSocket() => _instance;
  StreamController<Map<String, dynamic>> streamController = StreamController.broadcast();
  StreamSubscription<Map<String, dynamic>>? streamUsersChatSubscription;
  StreamSubscription<Map<String, dynamic>>? streamChatSubscription;
  bool isListening = false;
  startChatListSocket(
    Function(Map<String, dynamic>) userChatsData,
  ) {
    streamUsersChatSubscription?.cancel();
    streamUsersChatSubscription = streamController.stream.listen(userChatsData);
    // if (isListening.isFalse) {
    //   isListening = true;
    //   SocketService().listenToChannelWithEvent(
    //     channel: 'chat',
    //     id: getBlocData<AuthCubit>().userData!.user!.id!,
    //     event: 'MessageDelivered',
    //     listenCallback: (data) {
    //       streamController.add(data);
    //     },
    //   );
    // }
  }

  startChatSocket(Function(Map<String, dynamic>) chatData) {
    streamChatSubscription?.cancel();
    streamChatSubscription = streamController.stream.listen(chatData);
    // if (isListening.isFalse) {
    //   isListening = true;
    //   SocketService().listenToChannelWithEvent(
    //     channel: 'chat',
    //     id: getBlocData<AuthCubit>().userData!.user!.id!,
    //     event: 'MessageDelivered',
    //     listenCallback: (data) {
    //       streamController.add(data);
    //     },
    //   );
    // }
  }

  void sendMessage(dynamic message) {
    streamController.add(message);
  }
}
