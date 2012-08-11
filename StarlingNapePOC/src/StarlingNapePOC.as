package
{
	import com.realeyes.sample.events.DebugOverlayEvent;
	import com.realeyes.sample.game.Game;
	
	import flash.display.Sprite;
	import starling.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import nape.util.BitmapDebug;
	
	import starling.core.Starling;
	
	[SWF( frameRate="60", width="500", height="500", backgroundColor="0x333333")]
	public class StarlingNapePOC extends Sprite
	{
		public var debug:Boolean;
		public var renderSurface:BitmapDebug;
		
		public function StarlingNapePOC()
		{
			var star:Starling = new Starling( Game, stage );
			star.stage.addEventListener( DebugOverlayEvent.DEBUG_OVERLAY_READY, _onDebugOverlayReady );
			star.stage.addEventListener( KeyboardEvent.KEY_UP, _onKeyUp );
			
			star.start();
			
		}
		
		private function _onDebugOverlayReady( event:DebugOverlayEvent ):void
		{
			renderSurface = event.debugOverlay;
			renderSurface.display.visible = debug;
			addChild( renderSurface.display );
		}
		
		private function _onKeyUp( event:KeyboardEvent ):void
		{
			if( event.keyCode == Keyboard.D )
			{
				debug = !debug;
				if( renderSurface )
				{
					renderSurface.display.visible = debug;
				}
			}
		}
	}
}