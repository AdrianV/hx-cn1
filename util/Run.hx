package util;

/**
 * ...
 * @author 
 */

//import java.lang.Runnable;

@:nativeGen
class Run implements Runnable
{

	var _dg: Void->Void;
	public function new(dg: Void->Void) 
	{
		//super();
		_dg = dg;
	}
	
	//@:overload(function(): Void {})
	public function run() {
		if (_dg != null) _dg();
	}
	
}