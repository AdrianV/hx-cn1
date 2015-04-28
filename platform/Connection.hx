package platform;

/**
 * ...
 * @author Adrian Veith
 */

import com.codename1.io.NetworkManager;

@:enum abstract Connection(String) to String {
	var UNKNOWN = "unknown";
    var ETHERNET = "ethernet";
    var WIFI = "wifi";
	var CELL_2G = "2g";
	var CELL_3G = "3g";
	var CELL_4G = "4g";
	var CELL = "cellular";
	var NONE = "none";
	
    static public var type(get, null): Connection;
    static function get_type(): Connection return {
		var nm = NetworkManager.getInstance();
		var ap = nm.getCurrentAccessPoint();
		
		return ap != null ? switch (nm.getAPType(ap) ) {
			case NetworkManager.ACCESS_POINT_TYPE_CABLE: ETHERNET;
			case NetworkManager.ACCESS_POINT_TYPE_CORPORATE: ETHERNET;
			default: UNKNOWN; 
		} : UNKNOWN;
	}
}

