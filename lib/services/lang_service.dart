// enumeration
enum Language{en,uz,ru}

class LangService{
  //field
  static Language _language = Language.en;

  //setter
static set language(Language language){
  _language = language;
}

// getter
static Language get language => _language;

}