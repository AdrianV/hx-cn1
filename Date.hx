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
package;
import haxe.Int64;

@:SuppressWarnings("deprecation")
@:coreApi class Date
{
	static private var _offset = p4n.DateTime.encode(1970, 1, 1); 

	private var date: p4n.DateTime;
	
	public function new(year : Int, month : Int, day : Int, hour : Int, min : Int, sec : Int ) : Void
	{
		//issue #1769
		date = p4n.DateTime.encodeDateTime(year, month +1, day, hour, min, sec);
	}

	public inline function getTime() : Float
	{
		return date / p4n.DateTime.SECONDS;
	}

	public inline function getHours() : Int
	{
		return date.decodeTime().hour;
	}

	public inline function getMinutes() : Int
	{
		return date.decodeTime().minute;
	}

	public inline function getSeconds() : Int
	{
		return Std.int(date.decodeTime().sec);
	}

	public inline function getFullYear() : Int
	{
		return date.year();
	}

	public inline function getMonth() : Int
	{
		return date.month();
	}

	public inline function getDate() : Int
	{
		return Std.int(date - _offset);
	}

	public inline function getDay() : Int
	{
		return date.day();
	}

	public function toString():String
	{
		var dt = date.decodeDateTime();
		return (dt.year)
			+"-"+(if( dt.month < 10 ) "0"+ dt.month else ""+ dt.month)
			+"-"+(if( dt.day < 10 ) "0"+ dt.day else ""+ dt.day)
			+" "+(if( dt.hour < 10 ) "0"+ dt.hour else ""+ dt.hour)
			+":"+(if( dt.minute < 10 ) "0"+ dt.minute else ""+ dt.minute)
			+":"+(if( dt.sec < 10 ) "0"+ dt.sec else ""+ dt.sec);
	}

	static public function now() : Date
	{
		var d = new Date(0, 0, 0, 0, 0, 0);
		var t: Float = cast(new java.util.Date().getTime(), Float);
		d.date = t * p4n.DateTime.SECONDS + _offset;
		return d;
	}

	static public function fromTime( t : Float ) : Date
	{
		var d = new Date(0, 0, 0, 0, 0, 0);
		d.date = t * p4n.DateTime.SECONDS + _offset;
		return d;
	}

	static public function fromString( s : String ) : Date
	{
		switch( s.length )
		{
			case 8: // hh:mm:ss
				var k = s.split(":");
				var d : Date = new Date(0, 0, 0, Std.parseInt(k[0]), Std.parseInt(k[1]), Std.parseInt(k[2]));
				return d;
			case 10: // YYYY-MM-DD
				var k = s.split("-");
				return new Date(Std.parseInt(k[0]),Std.parseInt(k[1]) - 1,Std.parseInt(k[2]),0,0,0);
			case 19: // YYYY-MM-DD hh:mm:ss
				var k = s.split(" ");
				var y = k[0].split("-");
				var t = k[1].split(":");
				return new Date(Std.parseInt(y[0]),Std.parseInt(y[1]) - 1,Std.parseInt(y[2]),Std.parseInt(t[0]),Std.parseInt(t[1]),Std.parseInt(t[2]));
			default:
				throw "Invalid date format : " + s;
		}
	}
}
