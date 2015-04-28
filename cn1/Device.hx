package cn1;

/**
 * ...
 * @author 
 */
class Device
{


	static public function uuid(): String {
		var uid = java.lang.Long.LongClass._toString(com.codename1.io.Log.getUniqueDeviceId(), 16);
		return uid;
	}
}