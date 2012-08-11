package com.realeyes.sample.model.constants
{
	import nape.dynamics.InteractionGroup;

	public class CollisionGroups
	{
		public static const TURRET_GROUP:InteractionGroup = new InteractionGroup( true );
		public static const TARGETS_GROUP:InteractionGroup = new InteractionGroup( false );
	}
}