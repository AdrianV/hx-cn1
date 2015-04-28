package java.net;

/**
 * ...
 * @author 
 */
@:keep
class URLEncoder
{

	static public function encode(url: String, enc: String) 
	{
		return com.codename1.io.Util.encodeUrl(url);
	}
	
}