package com.realeyes.sample.view.sprites
{
	import com.realeyes.sample.model.constants.CallbackTypes;
	import com.realeyes.sample.model.constants.CollisionGroups;
	import com.realeyes.sample.utils.MathUtils;
	import com.realeyes.sample.view.sprites.graphics.ShotGraphic;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import nape.callbacks.CbType;
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.phys.GravMassMode;
	import nape.phys.InertiaMode;
	import nape.phys.Material;
	import nape.shape.Circle;
	import nape.shape.Shape;
	
	public class Shot extends Body
	{
		public static const MOVE_INC:Number = 300;
		
		private var _timer:Timer;
		
		override public function Shot( type:BodyType=null, position:Vec2=null, angle:Number=0 )
		{
			super(type, position);
			
			var shape:Shape = new Circle( 5 );
			shape.material = new Material( 1, 0, 0, .0001 );
			shapes.add( shape );
			group = CollisionGroups.TURRET_GROUP;
			velocity = MathUtils.getMovementVector( MOVE_INC, angle );
			rotation = angle;	
			
			graphic = new ShotGraphic();
			
			align();
			
			cbType = CallbackTypes.SHOT_CALLBACK;
			
			_initTimer();
		}
		
		//TODO: want to find a different way, but unsure how to get a slower shot that doesn't lose steam
		private function _initTimer():void
		{
			_timer = new Timer( 250 );
			_timer.addEventListener( TimerEvent.TIMER, _onTimer );
			_timer.start();
		}
		
		private function _onTimer( event:TimerEvent ):void
		{
			velocity = MathUtils.getMovementVector( MOVE_INC, rotation );
		}
	}
}