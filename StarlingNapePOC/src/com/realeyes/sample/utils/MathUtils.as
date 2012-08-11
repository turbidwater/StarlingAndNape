package com.realeyes.sample.utils
{
	import nape.geom.Vec2;

	public class MathUtils
	{
		public static const TO_RADIANS_FACTOR:Number = 180 / Math.PI;
		public static const TO_DEGREES_FACTOR:Number = Math.PI / 180;
		
		public static function toRadians( degrees:Number ):Number
		{
			return degrees * TO_RADIANS_FACTOR;
		}
		
		public static function toDegrees( radians:Number ):Number
		{
			return radians * TO_DEGREES_FACTOR;
		}
		
		public static function getMovementVector( dist:Number, radians:Number ):Vec2
		{
			var h:Number = dist;
			var r:Number = radians;
			var moveX:Number = h * Math.cos( r );
			var moveY:Number = h * Math.sin( r );
			
			return new Vec2( moveX, moveY );
		}
		
		public static function getOffsetPosition( pos:Vec2, dist:Number, radians:Number ):Vec2
		{
			var offsets:Vec2 = getMovementVector( dist, radians );
			return new Vec2( pos.x + offsets.x, pos.y + offsets.y );
		}
	}
}