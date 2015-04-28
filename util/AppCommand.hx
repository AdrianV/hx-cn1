package util;

/**
 * ...
 * @author 
 */

import com.codename1.ui.Command;
import com.codename1.ui.events.ActionEvent;

class AppCommand extends Command
{

	public var handler : util.OnAction.ActionHandler;
	
	@:overload override function actionPerformed(evt: ActionEvent): Void {
		if (handler != null) handler(evt);
	}
}