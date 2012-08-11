package com.realeyes.sample.view.sprites
{
	import com.realeyes.sample.model.constants.CollisionGroups;
	import com.realeyes.sample.utils.MathUtils;
	import com.realeyes.sample.view.sprites.graphics.TurretGraphic;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.phys.Material;
	import nape.shape.Polygon;
	import nape.shape.Shape;
	
	public class Turret extends Body
	{
		//===============================================================
		//	PROPERTY DECLARATIONS
		//===============================================================
		public static const LEFT:String = 'left';
		public static const RIGHT:String = 'right';
		
		protected static const MOVE_INC:Number = 100;
		protected static const TURN_INC:Number = 2;
		
		private var _degreesOffset:Number = 270;
		
		
		//===============================================================
		//	INIT METHODS
		//===============================================================
		override public function Turret( type:BodyType=null, position:Vec2=null )
		{
			super( type, position );
			
			var shape:Shape = new Polygon( Polygon.regular( 30, 30, 3 ) );
			shape.material = new Material( 0, 1, 1 );
			shapes.add( shape );
			
			//rotationDegrees = 0;
			
			graphic = new TurretGraphic();
			align();
			
			group = CollisionGroups.TURRET_GROUP;
		}
		
		
		//===============================================================
		//	CONTROL METHODS
		//===============================================================
		public function forward():void
		{
			velocity = MathUtils.getMovementVector( MOVE_INC, rotation );
		}
		
		public function backward():void
		{
			velocity = MathUtils.getMovementVector( MOVE_INC, rotation + Math.PI );
		}
		
		public function turn( dir:String ):void
		{
			if( dir == LEFT )
			{
				angularVel = -TURN_INC;
			}
			else
			{
				angularVel = TURN_INC;
			}
		}
		
		public function fire():Shot
		{
			var pos:Vec2 = MathUtils.getOffsetPosition( position, 25, rotation );
			var shot:Shot = new Shot( BodyType.DYNAMIC, pos, rotation );
			return shot;
		}
		
		
		//===============================================================
		//	GETTER/SETTERS
		//===============================================================
		public function get rotationDegrees():Number
		{
			return MathUtils.toDegrees( rotation ) + degreesOffset;
		}
		public function set rotationDegrees( value:Number ):void
		{
			rotation = MathUtils.toRadians( value - degreesOffset );
		}
		
		public function get degreesOffset():Number
		{
			return _degreesOffset;
		}
		
		public function get radiansOffset():Number
		{
			return _degreesOffset * (Math.PI/180);
		}
		
	}
}