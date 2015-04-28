/*
 * Copyright (C)2005-2012 Haxe Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
package sys.net;

#if false
import java.net.InetAddress;
#end

class Host {
	public var ip(default,null) : Int;

#if false
@:allow(sys.net) private var wrapped:InetAddress;
#end
	@:allow(sys.net) private var _name: String;
	public function new( name : String ) : Void
	{
		_name = name;
		#if false
		try
			this.wrapped = InetAddress.getByName(name)
		catch(e:Dynamic) throw e;
		var rawIp = wrapped.getAddress();
		//network byte order assumed
		this.ip = cast(rawIp[3], Int) | (cast(rawIp[2], Int) << 8) | (cast(rawIp[1], Int) << 16) | (cast(rawIp[0], Int) << 24);
		#end
		throw "not supported";
	}

	public function toString() : String
	{
		#if false
		return wrapped.getHostAddress();
		#end
		return "";
	}

	public function reverse() : String
	{
		#if false
		return wrapped.getHostName();
		#end
		return "";
	}

	public static function localhost() : String
	{
		#if false
		try
		{
			return InetAddress.getLocalHost().getHostName();
		}
		catch (e:Dynamic) throw e;
		#end
		return "127.0.0.1";
	}

}
