import '../interface/top_manga_interface.dart';
import '../model/manga_response_model.dart';
import '../service/network_service.dart';

class TopMangaController extends ITopManga<MangaResponseModel?> {
  final NetworkManager _service = NetworkManager.instance;

  @override
  Future<MangaResponseModel?> fetchTopManga(int page) {
    return _service.fetchTopManga(page);
  }
}
