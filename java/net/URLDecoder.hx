package java.net;

/**
 * ...
 * @author 
 */
@:keep
class URLDecoder
{

	static public function decode(url: String, enc: String): String 
	{
		return com.codename1.io.Util.decode(url, enc, false);
	}
	
}