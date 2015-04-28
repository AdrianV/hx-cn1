package platform;

/**
 * ...
 * @author 
 */

import com.codename1.io.Storage;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import com.codename1.io.Util;

class LocalStorage {
	
	static var _data: Map<String,String>;
	static var _done = false;
	static var _changeCount: Int = 0;
	static var _flushCount: Int = 0;
	
	//static public function key(n: Int): String;
	
	static function readFromStorage() {
		var storage = Storage.getInstance();
		_data = new Map();
		if (! storage.exists("LocalStorage")) return;
		var store = storage.createInputStream("LocalStorage");
		var data = haxe.io.Bytes.alloc(store.available());
		store.read(data.getData());
		var inp = new haxe.io.BytesInput(data);
		inline function readString(): String {
			var len = inp.readInt32();
			return inp.readString(len);
		}
		while (inp.readByte() == 1) {
			var key = readString();
			var val = readString();
			if (key != null && val != null) _data.set(key, val);
		}
		inp.close();
	}
	
	static function saveToStorage() {
		var out = new haxe.io.BytesOutput();
		inline function writeString(val: String) {
			out.writeInt32(val.length);
			out.writeString(val);
		}
		var keys = _data.keys();
		var cnt = 0;
		for (key in keys) {
			cnt++;
			out.writeByte(1);
			var val = _data.get(key);
			writeString(key);
			writeString(val);
		}
		out.writeByte(0);
		out.close();
		if (cnt == 0) {
			clear();
		} else {
			var data = out.getBytes();
			var store = Storage.getInstance().createOutputStream("LocalStorage");
			untyped __java__("store.write(data.b, 0, data.length);");
			store.close();
		}
		_flushCount = _changeCount;
	}
	
	static inline function flush() {
		if (_changeCount != _flushCount) saveToStorage();
	}
	
	static inline function getStorage() {
		if (! _done) {
			try {
				readFromStorage();
			} catch (e: Dynamic) {
				trace(e);
				_data = new Map();
			}
			_done = true;
		}
	}
	
	static public function getItem(key: String): String {
		getStorage();
		var ret: String = null;
		if (_data.exists(key) ) {
			ret = _data.get(key);
		}
		return ret;
	}
	
	static public function setItem(key: String, value: String): Void {
		getStorage();
		if (value != null) {
			var old = _data.get(key);
			if (old == null || old != value) {
				_data.set(key, value);
				_changeCount++;
			}
		} else
			removeItem(key);
		if (key.indexOf("#") < 0)
			flush();
	}
	
	static public function removeItem(key: String): Void {
		getStorage();
		if (_data.exists(key)) {
			_data.remove(key);
			_changeCount++;
			flush();
		}
	}
	
	static public function clear(): Void {
		Storage.getInstance().deleteStorageFile("LocalStorage");
		_changeCount = _flushCount = 0;
	}
	
	static public function exists(key: String): Bool {
		getStorage();
		if (_data != null) {
			return _data.exists(key);
		}
		return false;
	}
}
