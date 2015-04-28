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

@:coreApi
@:native("java.lang.Math") extern class Math
{
	static var PI(default,null) : Float;
	static var NaN(default,null) : Float;
	static var NEGATIVE_INFINITY(default,null) : Float;
	static var POSITIVE_INFINITY(default,null) : Float;

	static function abs(v:Float):Float;
	static function min(a:Float,b:Float):Float;
	static function max(a:Float,b:Float):Float;
	static function sin(v:Float):Float;
	static function cos(v:Float):Float;
	static inline function atan2(y:Float, x:Float):Float return com.codename1.util.MathUtil.atan2(y, x);
	static function tan(v:Float):Float;
	static inline function exp(v:Float):Float return com.codename1.util.MathUtil.exp(v);
	static inline function log(v:Float):Float return com.codename1.util.MathUtil.log(v);
	static function sqrt(v:Float):Float;
	static function round(v:Float):Int;
	static inline function floor(v:Float):Int return cast(com.codename1.util.MathUtil.floor(v), Int);
	static function ceil(v:Float):Int;
	static inline function atan(v:Float):Float return com.codename1.util.MathUtil.atan(v);
	static function fround(v:Float):Float;
	static inline function ffloor(v:Float):Float return { var vv = v; untyped __java__("Math.floor(vv)"); };
	static inline function fceil(v:Float):Float return { var vv = v; untyped __java__("Math.ceil(vv)"); };
	static inline function asin(v:Float):Float return com.codename1.util.MathUtil.asin(v);
	static inline function acos(v:Float):Float return com.codename1.util.MathUtil.acos(v);
	static inline function pow(v:Float, exp:Float):Float return com.codename1.util.MathUtil.pow(v, exp);
	static inline function random() : Float return MathHelper.random();

	static function isFinite( f : Float ) : Bool;
	static function isNaN( f : Float ) : Bool;
}

@:nativeGen
@:native("platform.util.MathHelper")
private class MathHelper 
{
	static var _rand = new java.util.Random();
	public static inline function random(): Float return _rand.nextDouble();
}
