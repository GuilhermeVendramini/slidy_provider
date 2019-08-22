import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_bloc.dart';
import '../../repositories/hasura/message/hasura_message_repository.dart';
import '../../shared/models/message/message_model.dart';
import 'home_validators.dart';

class HomeBloc extends ChangeNotifier with HomeValidators {
  final HasuraMessageRepository _messageRepository;
  final AppProvider _appBloc;

  HomeBloc(this._messageRepository, this._appBloc);

  BehaviorSubject<String> _messageController = BehaviorSubject<String>();
  BehaviorSubject<List<MessageModel>> messagesController =
      BehaviorSubject<List<MessageModel>>();

  @override
  void dispose() async {
    super.dispose();
    _messageController.close();
    await messagesController.drain();
    messagesController.close();
  }
}

class Home extends HomeBloc {
  Home(HasuraMessageRepository messageRepository, AppBloc appBloc)
      : super(messageRepository, appBloc);

  Stream<String> get streamMessage =>
      _messageController.stream.transform(validateMessage);

  Function(String) get changeMessage {
    return _messageController.sink.add;
  }
}

class HomeProvider extends Home {
  HomeProvider(HasuraMessageRepository messageRepository, AppBloc appBloc)
      : super(messageRepository, appBloc);

  void sendMessage() {
    if (_messageController.value != null) {
      _messageRepository.sendMessage(
        message: _messageController.value,
        userId: _appBloc.getUser.id,
      );
    }
  }

  loadMessages() {
    _messageRepository.getMessages().pipe(messagesController);
  }
}
