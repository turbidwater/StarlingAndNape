package com.realeyes.sample.events
{
	import nape.util.BitmapDebug;
	
	import starling.events.Event;
	
	public class DebugOverlayEvent extends Event
	{
		static public const DEBUG_OVERLAY_READY:String = 'debugOverlayReady';
		
		public var debugOverlay:BitmapDebug;
		
		public function DebugOverlayEvent( type:String, debugOverlay:BitmapDebug, bubbles:Boolean=true )
		{
			super(type, bubbles);
			
			this.debugOverlay = debugOverlay;
		}
	}
}