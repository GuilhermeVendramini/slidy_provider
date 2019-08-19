import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_bloc.dart';
import '../../repositories/hasura/message/hasura_message_repository.dart';
import '../../shared/models/message/message_model.dart';
import 'home_validators.dart';

class HomeBloc extends ChangeNotifier with HomeValidators {
  HasuraMessageRepository _messageRepository;
  AppBloc _appBloc;

  HomeBloc(this._messageRepository, this._appBloc);

  BehaviorSubject<String> _messageController = BehaviorSubject<String>();
}

class Home extends HomeBloc {
  Home(HasuraMessageRepository messageRepository, AppBloc appBloc)
      : super(messageRepository, appBloc);

  Stream<String> get streamMessage =>
      _messageController.stream.transform(validateMessage);

  BehaviorSubject<List<MessageModel>> messagesController =
      BehaviorSubject<List<MessageModel>>();

  Function(String) get changeMessage {
    return _messageController.sink.add;
  }

  void sendMessage() {
    if (_messageController.value != null) {
      _messageRepository.sendMessage(
        message: _messageController.value,
        userId: _appBloc.userController.value.id,
      );
    }
  }

  @override
  void dispose() {
    _messageController.close();
    messagesController.close();
    super.dispose();
  }
}

class HomeProvider extends Home {
  HomeProvider(HasuraMessageRepository messageRepository, AppBloc appBloc)
      : super(messageRepository, appBloc);

  listenMessage() {
    Observable(_messageRepository.getMessages()).pipe(messagesController);
  }
}
