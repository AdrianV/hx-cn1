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
import com.codename1.io.SocketConnection;


class Socket extends com.codename1.io.SocketConnection {

	public var input(default,null) : haxe.io.Input;
	public var output(default,null) : haxe.io.Output;

	public var custom : Dynamic;

	private var _port: Int;
	private var _stop: com.codename1.io.Socket.Socket_StopListening;

	public function new() : Void
	{
		super();
		create();
	}

	private function create():Void
	{
	}

	public function close() : Void
	{
		try
		{
			if (_stop != null)
				_stop.stop();
		}
		catch(e:Dynamic) throw e;
	}

	public function read() : String
	{
		return input.readAll().toString();
	}

	public function write( content : String ) : Void
	{
		output.writeString(content);
	}

	@:keep @:overload override function connectionError(errorCode: Int, message: String): Void {
		
	}
	@:keep @:overload override function connectionEstablished(inp: java.io.InputStream, out: java.io.OutputStream): Void {
		this.output = new java.io.NativeOutput(out);
		this.input = new java.io.NativeInput(inp);		
	}
	
	public function connect( host : Host, port : Int ) : Void
	{
		try
		{
			_port = port;
			//_sock = new com.codename1.io.Socket();
			com.codename1.io.Socket.connect(host._name, port, this);
		}
		catch(e:Dynamic) throw e;
	}

	public function listen( connections : Int ) : Void
	{
		throw "not supported";
	}

	public function shutdown( read : Bool, write : Bool ) : Void
	{
		try
		{
			//if (read)
			//	sock.shutdownInput();
			//if (write)
			//	sock.shutdownOutput();
		}
		catch(e:Dynamic) throw e;
	}

	public function bind( host : Host, port : Int ) : Void
	{
		throw "not supported";
		#if false
		if (boundAddr != null)
		{
			if (server.isBound()) throw "Already bound";
		}
		this.boundAddr = new java.net.InetSocketAddress(host.wrapped, port);
		#end
		
	}

	public function accept() : Socket
	{
		#if false
		var ret = try server.accept() catch(e:Dynamic) throw e;

		var s = new Socket();
		s.sock = ret;
		s.output = new java.io.NativeOutput(ret.getOutputStream());
		s.input = new java.io.NativeInput(ret.getInputStream());

		return s;
		#end
		throw "not supported";
		return null;
	}

	public function peer() : { host : Host, port : Int }
	{
		return null;
	}

	public function host() : { host : Host, port : Int }
	{
		var host = new Host(null);
		host._name = com.codename1.io.Socket.getHostOrIP();

		return { host: host, port: _port };
	}

	public function setTimeout( timeout : Float ) : Void
	{
		#if false
		try
			sock.setSoTimeout( Std.int(timeout * 1000) )
		catch (e:Dynamic) throw e;
		#end
	}

	public function waitForRead() : Void
	{
		throw "Not implemented";
	}

	public function setBlocking( b : Bool ) : Void
	{
		throw "Not implemented";
	}

	public function setFastSend( b : Bool ) : Void
	{
		#if false
		try
			sock.setTcpNoDelay(b)
		catch (e:Dynamic) throw e;
		#end
	}

	public static function select(read : Array<Socket>, write : Array<Socket>, others : Array<Socket>, ?timeout : Float) : { read: Array<Socket>,write: Array<Socket>,others: Array<Socket> }
	{
		throw "Not implemented";
		return null;
	}
}
