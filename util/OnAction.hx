package util;

/**
 * ...
 * @author 
 */

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.ExprTools;
import com.codename1.ui.events.ActionEvent;
import com.codename1.ui.events.ActionListener;

typedef ActionHandler = ActionEvent->Void;


@:nativeGen
class OnAction implements ActionListener {
	var _dg: ActionHandler;
	public inline function new(dg: ActionHandler) _dg = dg;
	
	public inline function actionPerformed(evt) _dg(evt);
}
