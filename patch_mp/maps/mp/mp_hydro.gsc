//checked includes changed to match cerberus output
#include maps/mp/gametypes/_weaponobjects;
#include maps/mp/killstreaks/_rcbomb;
#include maps/mp/_tacticalinsertion;
#include maps/mp/killstreaks/_airsupport;
#include maps/mp/_compass;
#include maps/mp/mp_hydro_amb;
#include maps/mp/_load;
#include maps/mp/mp_hydro_fx;
#include maps/mp/_events;
#include common_scripts/utility;
#include maps/mp/_utility;

main() //checked changed to match cerberus output
{
	level.levelspawndvars = ::levelspawndvars;
	precacheitem( "hydro_water_mp" );
	maps/mp/mp_hydro_fx::main();
	precachemodel( "collision_physics_256x256x10" );
	precachemodel( "collision_missile_128x128x10" );
	precachemodel( "collision_physics_64x64x64" );
	maps/mp/_load::main();
	maps/mp/mp_hydro_amb::main();
	maps/mp/_compass::setupminimap( "compass_map_mp_hydro" );
	maps/mp/mp_hydro_amb::main();
	/*
/#
	execdevgui( "devgui_mp_hydro" );
#/
	*/
	registerclientfield( "world", "pre_wave", 1, 1, "int" );
	registerclientfield( "world", "big_wave", 1, 1, "int" );
	setdvar( "compassmaxrange", "2300" );
	game[ "strings" ][ "war_callsign_a" ] = &"MPUI_CALLSIGN_MAPNAME_A";
	game[ "strings" ][ "war_callsign_b" ] = &"MPUI_CALLSIGN_MAPNAME_B";
	game[ "strings" ][ "war_callsign_c" ] = &"MPUI_CALLSIGN_MAPNAME_C";
	game[ "strings" ][ "war_callsign_d" ] = &"MPUI_CALLSIGN_MAPNAME_D";
	game[ "strings" ][ "war_callsign_e" ] = &"MPUI_CALLSIGN_MAPNAME_E";
	game[ "strings_menu" ][ "war_callsign_a" ] = "@MPUI_CALLSIGN_MAPNAME_A";
	game[ "strings_menu" ][ "war_callsign_b" ] = "@MPUI_CALLSIGN_MAPNAME_B";
	game[ "strings_menu" ][ "war_callsign_c" ] = "@MPUI_CALLSIGN_MAPNAME_C";
	game[ "strings_menu" ][ "war_callsign_d" ] = "@MPUI_CALLSIGN_MAPNAME_D";
	game[ "strings_menu" ][ "war_callsign_e" ] = "@MPUI_CALLSIGN_MAPNAME_E";
	spawncollision( "collision_physics_256x256x10", "collider", ( 3695, 340, 84 ), ( 0, 44.8, -90 ) );
	spawncollision( "collision_physics_256x256x10", "collider", ( 3449, 82, 84 ), ( 0, 44.8, -90 ) );
	spawncollision( "collision_physics_64x64x64", "collider", ( 577.5, -1835, 309.5 ), ( 0, 0, 0 ) );
	spawncollision( "collision_physics_64x64x64", "collider", ( 577.5, -1786.5, 339.5 ), ( 0, 0, 0 ) );
	spawncollision( "collision_physics_64x64x64", "collider", ( -641.5, -1834.5, 309.5 ), ( 0, 0, 0 ) );
	spawncollision( "collision_physics_64x64x64", "collider", ( -641.5, -1786, 339.5 ), ( 0, 0, 0 ) );
	spawncollision( "collision_missile_128x128x10", "collider", ( -521.5, -2106, 325 ), vectorScale( ( 0, 0, 1 ), 90 ) );
	spawncollision( "collision_missile_128x128x10", "collider", ( -521.5, -2041, 325 ), vectorScale( ( 0, 0, 1 ), 90 ) );
	spawncollision( "collision_missile_128x128x10", "collider", ( 471.5, -2106, 325 ), vectorScale( ( 0, 0, 1 ), 90 ) );
	spawncollision( "collision_missile_128x128x10", "collider", ( 471.5, -2041, 325 ), vectorScale( ( 0, 0, 1 ), 90 ) );
	spawncollision( "collision_missile_128x128x10", "collider", ( 1432, -1912, 376.5 ), vectorScale( ( 0, 0, 1 ), 90 ) );
	spawncollision( "collision_missile_128x128x10", "collider", ( 1516.5, -1912, 376.5 ), vectorScale( ( 0, 0, 1 ), 90 ) );
	spawncollision( "collision_missile_128x128x10", "collider", ( -1490, -1916.5, 376.5 ), vectorScale( ( 0, 0, 1 ), 90 ) );
	spawncollision( "collision_missile_128x128x10", "collider", ( -1574.5, -1916.5, 376.5 ), vectorScale( ( 0, 0, 1 ), 90 ) );
	level.waterrushfx = loadfx( "maps/mp_maps/fx_mp_hydro_dam_water_wall" );
	level.waterambientfxmiddlefront = loadfx( "maps/mp_maps/fx_mp_hydro_flood_splash_middle_front" );
	level.waterambientfxmiddleback = loadfx( "maps/mp_maps/fx_mp_hydro_flood_splash_middle_back" );
	level.waterambientfxleftfront = loadfx( "maps/mp_maps/fx_mp_hydro_flood_splash_right" );
	level.waterambientfxleftmiddle = loadfx( "maps/mp_maps/fx_mp_hydro_flood_splash_left_mid" );
	level.waterambientfxleftback = loadfx( "maps/mp_maps/fx_mp_hydro_flood_splash_left_back" );
	level.waterambientfxrightfront = loadfx( "maps/mp_maps/fx_mp_hydro_flood_splash_left" );
	level.waterambientfxrightmiddle = loadfx( "maps/mp_maps/fx_mp_hydro_flood_splash_right_mid" );
	level.waterambientfxrightback = loadfx( "maps/mp_maps/fx_mp_hydro_flood_splash_right_back" );
	level.waterambientfxboxfront = loadfx( "maps/mp_maps/fx_mp_hydro_flood_splash_box" );
	level.waterambientfxboxback = loadfx( "maps/mp_maps/fx_mp_hydro_flood_splash_box_back" );
	setdvar( "tu6_player_shallowWaterHeight", "10.5" );
	visionsetnaked( "mp_hydro", 1 );
	level thread removeobjectsondemovertime();
	set_dvar_if_unset( "scr_hydro_water_rush", 1 );
	if ( getgametypesetting( "allowMapScripting" ) )
	{
		level.overrideplayerdeathwatchtimer = ::leveloverridetime;
		initwatertriggers();
	}
}

levelspawndvars( reset_dvars ) //checked matches cerberus output
{
	ss = level.spawnsystem;
	ss.enemy_influencer_radius = set_dvar_float_if_unset( "scr_spawn_enemy_influencer_radius", "2400", reset_dvars );
}

leveloverridetime( defaulttime ) //checked matches cerberus output
{
	if ( isDefined( self.lastattacker ) && isDefined( self.lastattacker.targetname ) && self.lastattacker.targetname == "water_kill_trigger" )
	{
		return 0.4;
	}
	return defaulttime;
}

initwatertriggers() //checked changed to match cerberus output
{
	water_kill_triggers = getentarray( "water_kill_trigger", "targetname" );
	water_mover = spawn( "script_model", ( 0, 0, 0 ) );
	water_mover setmodel( "tag_origin" );
	water_ambient_mover = spawn( "script_model", ( 0, 0, 0 ) );
	water_ambient_mover setmodel( "tag_origin" );
	water_ambient_front_pillar = spawn( "script_model", ( -31, -888, 202 ) );
	water_ambient_front_pillar setmodel( "tag_origin" );
	water_ambient_front_pillar.angles = vectorScale( ( 0, 1, 0 ), 90 );
	water_ambient_front_pillar linkto( water_ambient_mover );
	water_ambient_back_pillar = spawn( "script_model", ( -32, -1535, 202 ) );
	water_ambient_back_pillar setmodel( "tag_origin" );
	water_ambient_back_pillar.angles = vectorScale( ( 0, 1, 0 ), 90 );
	water_ambient_back_pillar linkto( water_ambient_mover );
	water_ambient_front_block = spawn( "script_model", ( -32, -331, 193 ) );
	water_ambient_front_block setmodel( "tag_origin" );
	water_ambient_front_block.angles = vectorScale( ( 0, 1, 0 ), 90 );
	water_ambient_front_block linkto( water_ambient_mover );
	water_ambient_back_block = spawn( "script_model", ( -32, -1800, 199 ) );
	water_ambient_back_block setmodel( "tag_origin" );
	water_ambient_back_block.angles = vectorScale( ( 0, 1, 0 ), 90 );
	water_ambient_back_block linkto( water_ambient_mover );
	water_ambient_back_right = spawn( "script_model", ( -467, -1975, 190 ) );
	water_ambient_back_right setmodel( "tag_origin" );
	water_ambient_back_right.angles = vectorScale( ( 0, 1, 0 ), 90 );
	water_ambient_back_right linkto( water_ambient_mover );
	water_ambient_back_left = spawn( "script_model", ( 404, -1975, 190 ) );
	water_ambient_back_left setmodel( "tag_origin" );
	water_ambient_back_left.angles = vectorScale( ( 0, 1, 0 ), 90 );
	water_ambient_back_left linkto( water_ambient_mover );
	water_ambient_middle_right = spawn( "script_model", ( -274, -1680, 185 ) );
	water_ambient_middle_right setmodel( "tag_origin" );
	water_ambient_middle_right.angles = vectorScale( ( 0, 1, 0 ), 90 );
	water_ambient_middle_right linkto( water_ambient_mover );
	water_ambient_middle_left = spawn( "script_model", ( 215, -1680, 185 ) );
	water_ambient_middle_left setmodel( "tag_origin" );
	water_ambient_middle_left.angles = vectorScale( ( 0, 1, 0 ), 90 );
	water_ambient_middle_left linkto( water_ambient_mover );
	water_ambient_front_right = spawn( "script_model", ( -333, -302, 185 ) );
	water_ambient_front_right setmodel( "tag_origin" );
	water_ambient_front_right.angles = vectorScale( ( 0, 1, 0 ), 90 );
	water_ambient_front_right linkto( water_ambient_mover );
	water_ambient_front_left = spawn( "script_model", ( 265, -302, 185 ) );
	water_ambient_front_left setmodel( "tag_origin" );
	water_ambient_front_left.angles = vectorScale( ( 0, 1, 0 ), 90 );
	water_ambient_front_left linkto( water_ambient_mover );
	water_pa_1 = spawn( "script_model", ( 1667, -1364, 684 ) );
	water_pa_1 setmodel( "tag_origin" );
	water_pa_2 = spawn( "script_model", ( -1806, -1375, 783 ) );
	water_pa_2 setmodel( "tag_origin" );
	water_pa_3 = spawn( "script_model", ( -100, -1375, 783 ) );
	water_pa_3 setmodel( "tag_origin" );
	wait 0.1;
	water_kill_triggers = [];
	water_kill_triggers[ 0 ] enablelinkto();
	water_kill_triggers[ 0 ] linkto( water_mover );
	water_kill_triggers[ 1 ] enablelinkto();
	water_kill_triggers[ 1 ] linkto( water_mover );
	playfxontag( level.waterambientfxmiddlefront, water_ambient_front_pillar, "tag_origin" );
	playfxontag( level.waterambientfxmiddleback, water_ambient_back_pillar, "tag_origin" );
	playfxontag( level.waterambientfxboxfront, water_ambient_front_block, "tag_origin" );
	playfxontag( level.waterambientfxboxback, water_ambient_back_block, "tag_origin" );
	playfxontag( level.waterambientfxrightback, water_ambient_back_right, "tag_origin" );
	playfxontag( level.waterambientfxleftback, water_ambient_back_left, "tag_origin" );
	playfxontag( level.waterambientfxrightmiddle, water_ambient_middle_right, "tag_origin" );
	playfxontag( level.waterambientfxleftmiddle, water_ambient_middle_left, "tag_origin" );
	playfxontag( level.waterambientfxrightfront, water_ambient_front_right, "tag_origin" );
	playfxontag( level.waterambientfxleftfront, water_ambient_front_left, "tag_origin" );
	setdvar( "R_WaterWaveBase", 0 );
	if ( level.timelimit )
	{
		seconds = level.timelimit * 60;
		add_timed_event( int( seconds * 0.25 ), "hydro_water_rush" );
		add_timed_event( int( seconds * 0.75 ), "hydro_water_rush" );
	}
	else if ( level.scorelimit )
	{
		add_score_event( int( level.scorelimit * 0.25 ), "hydro_water_rush" );
		add_score_event( int( level.scorelimit * 0.75 ), "hydro_water_rush" );
	}
	trigger = spawn( "trigger_radius", ( -28, -2208, -830 ), 0, 450, 40 );
	water_kill_triggers[ water_kill_triggers.size ] = trigger;
	self thread watchwatertrigger( water_mover, water_kill_triggers, water_pa_1, water_pa_2, water_pa_3, water_ambient_back_pillar, water_ambient_front_block, water_ambient_mover );
	wait 5;
	setdvar( "R_WaterWaveBase", 0 );
}

watchwatertrigger( water_mover, water_kill_triggers, water_pa_1, water_pa_2, water_pa_3, water_ambient_back, water_ambient_box, water_ambient_mover ) //checked changed to match cerberus output
{
	thread watchdevnotify();
	for ( ;; )
	{
		level waittill_any( "hydro_water_rush", "dev_water_rush" );
		setclientfield( "pre_wave", 1 );
		level thread waterkilltriggerthink( water_kill_triggers );
		water_ambient_back playloopsound( "amb_train_incomming_beep" );
		water_ambient_box playloopsound( "amb_train_incoming_beep" );
		water_pa_1 playsound( "evt_pa_atten" );
		water_pa_2 playsound( "evt_pa_atten" );
		water_pa_3 playsound( "evt_pa_atten" );
		wait 2;
		water_pa_1 playsound( "evt_pa_online" );
		water_pa_2 playsound( "evt_pa_online" );
		water_pa_3 playsound( "evt_pa_online" );
		water_fx1 = spawn( "script_model", water_kill_triggers[ 0 ].origin + vectorScale( ( 0, 1, 0 ), 1000 ) );
		water_fx1 setmodel( "tag_origin" );
		water_fx1.angles = vectorScale( ( 0, 1, 0 ), 90 );
		water_fx2 = spawn( "script_model", water_kill_triggers[ 1 ].origin + vectorScale( ( 0, 1, 0 ), 1000 ) );
		water_fx2 setmodel( "tag_origin" );
		water_fx2.angles = vectorScale( ( 0, 1, 0 ), 90 );
		exploder( 1005 );
		wait 3;
		water_pa_1 playsound( "evt_pa_online" );
		water_pa_2 playsound( "evt_pa_online" );
		water_pa_3 playsound( "evt_pa_online" );
		wait 1;
		playfxontag( level.waterrushfx, water_fx1, "tag_origin" );
		playfxontag( level.waterrushfx, water_fx2, "tag_origin" );
		water_fx1 playloopsound( "evt_water_wave" );
		water_fx2 playloopsound( "evt_water_wave" );
		water_mover.origin = ( 0, 0, 0 );
		setclientfield( "big_wave", 1 );
		water_mover moveto( vectorScale( ( 0, 1, 0 ), 2100 ), 2.5 );
		water_ambient_mover moveto( vectorScale( ( 0, 0, 1 ), 20 ), 2.5 );
		water_kill_triggers[ 2 ].origin += vectorScale( ( 0, 0, 1 ), 1000 );
		/*
/#
		maps/mp/killstreaks/_airsupport::debug_cylinder( water_kill_triggers[ 2 ].origin, 450, 40, ( 1, 0,1, 0,1 ), 1, 2500 );
#/
		*/
		level thread waterfxloopstarter( water_fx1, water_fx2, 5 );
		thread play_exploder();
		waterlevel = -24;
		wait 2;
		water_pa_1 playsound( "evt_pa_warn" );
		water_pa_2 playsound( "evt_pa_warn" );
		water_pa_3 playsound( "evt_pa_warn" );
		wait 3;
		water_pa_1 playsound( "evt_pa_offline" );
		water_pa_2 playsound( "evt_pa_offline" );
		water_pa_3 playsound( "evt_pa_offline" );
		wait 1;
		water_kill_triggers[ 2 ].origin -= vectorScale( ( 0, 0, 1 ), 1000 );
		/*
/#
		maps/mp/killstreaks/_airsupport::debug_cylinder( water_kill_triggers[ 2 ].origin, 450, 40, ( 1, 0,1, 0,1 ), 0, 2500 );
#/
		*/
		water_mover moveto( vectorScale( ( 0, 1, 0 ), 4100 ), 2.5 );
		water_ambient_mover moveto( ( 0, 0, 0 ), 2.5 );
		water_fx1 stoploopsound( 2 );
		water_fx2 stoploopsound( 2 );
		setclientfield( "pre_wave", 0 );
		wait 1.5;
		water_pa_1 playsound( "evt_pa_access" );
		water_pa_2 playsound( "evt_pa_access" );
		water_pa_3 playsound( "evt_pa_access" );
		wait 1;
		water_ambient_box stoploopsound( 1 );
		water_ambient_back stoploopsound( 1 );
		stop_exploder( 1005 );
		setdvar( "R_WaterWaveAmplitude", "0 0 0 0" );
		water_mover.origin = vectorScale( ( 0, 0, -1 ), 500 );
		wait 2;
		water_fx1 delete();
		water_fx2 delete();
		water_mover.origin = ( 0, 0, 0 );
		setclientfield( "big_wave", 0 );
		wait 5;
		level notify( "water_stop" );
	}
}

play_exploder() //checked matches cerberus output
{
	wait 0.2;
	exploder( 1002 );
	wait 0.5;
	exploder( 1001 );
}

watchdevnotify() //checked matches cerberus output dvar names not found
{
	startvalue = getDvar( #"1CC516F5" );
	for ( ;; )
	{
		should_water_rush = getDvar( #"1CC516F5" );
		if ( should_water_rush != startvalue )
		{
			level notify( "dev_water_rush" );
			startvalue = should_water_rush;
		}
		wait 0.2;
	}
}

waterfxloopstarter( fx1, fx2, looptime ) //checked matches cerberus output
{
	level thread waterfxloop( fx1, fx2 );
}

waterfxloop( fx1, fx2 ) //checked changed to match cerberus output
{
	start1 = fx1.origin;
	start2 = fx2.origin;
	fx1 moveto( fx1.origin + vectorScale( ( 0, 1, 0 ), 2200 ), 2.67 );
	fx2 moveto( fx2.origin + vectorScale( ( 0, 1, 0 ), 2200 ), 2.67 );
	wait 2.67;
	fx1 moveto( fx1.origin + ( 0, 600, -1000 ), 2.5 );
	fx2 moveto( fx2.origin + ( 0, 600, -1000 ), 2.5 );
	wait 3;
	fx1.origin = start1;
	fx2.origin = start2;
}

waterkilltriggerthink( triggers ) //checked partially changed to match cerberus output see info.md
{
	level endon( "water_stop" );
	for ( ;; )
	{
		wait 0.1;
		entities = getdamageableentarray( triggers[ 0 ].origin, 2000 );
		i = 0;
		while ( i < entities.size )
		{
			triggertouched = 0;
			if ( !entities[ i ] istouching( triggers[ 0 ] ) )
			{
				triggertouched = 1;
				if ( !entities[ i ] istouching( triggers[ 1 ] ) )
				{
					if ( !entities[ i ] istouching( triggers[ 2 ] ) )
					{
						i++;
						continue;
					}
				}
			}
			if ( isDefined( entities[ i ].model ) && entities[ i ].model == "t6_wpn_tac_insert_world" )
			{
				entities[ i ] maps/mp/_tacticalinsertion::destroy_tactical_insertion();
				i++;
				continue;
			}
			if ( !isalive( entities[ i ] ) )
			{
				i++;
				continue;
			}
			if ( isDefined( entities[ i ].targetname ) )
			{
				if ( entities[ i ].targetname == "talon" )
				{
					entities[ i ] notify( "death" );
					i++;
					continue;
				}
				if ( entities[ i ].targetname == "rcbomb" )
				{
					entities[ i ] maps/mp/killstreaks/_rcbomb::rcbomb_force_explode();
					i++;
					continue;
				}
				if ( entities[ i ].targetname == "riotshield_mp" )
				{
					entities[ i ] dodamage( 1, triggers[ triggertouched ].origin + ( 0, 0, 1 ), triggers[ triggertouched ], triggers[ triggertouched ], 0, "MOD_CRUSH" );
					i++;
					continue;
				}
			}
			if ( isDefined( entities[ i ].helitype ) && entities[ i ].helitype == "qrdrone" )
			{
				watcher = entity.owner maps/mp/gametypes/_weaponobjects::getweaponobjectwatcher( "qrdrone" );
				watcher thread maps/mp/gametypes/_weaponobjects::waitanddetonate( entities[ i ], 0, undefined );
				i++;
				continue;
			}
			if ( entities[ i ].classname == "grenade" )
			{
				if ( !isDefined( entities[ i ].name ) )
				{
					i++;
					continue;
				}
				if ( !isDefined( entities[ i ].owner ) )
				{
					i++;
					continue;
				}
				if ( entities[ i ].name == "proximity_grenade_mp" )
				{
					watcher = entity.owner getwatcherforweapon( entities[ i ].name );
					watcher thread maps/mp/gametypes/_weaponobjects::waitanddetonate( entities[ i ], 0, undefined, "script_mover_mp" );
					i++;
					continue;
				}
				if ( !isweaponequipment( entities[ i ].name ) )
				{
					i++;
					continue;
				}
				watcher = entities[ i ].owner getwatcherforweapon( entities[ i ].name );
				if ( !isDefined( watcher ) )
				{
					i++;
					continue;
				}
				watcher thread maps/mp/gametypes/_weaponobjects::waitanddetonate( entities[ i ], 0, undefined, "script_mover_mp" );
				i++;
				continue;
			}
			if ( entities[ i ].classname == "auto_turret" )
			{
				if ( !isDefined( entities[ i ].damagedtodeath ) || !entities[ i ].damagedtodeath )
				{
					entities[ i ] domaxdamage( triggers[ triggertouched ].origin + ( 0, 0, 1 ), triggers[ triggertouched ], triggers[ triggertouched ], 0, "MOD_CRUSH" );
				}
				i++;
				continue;
			}
			if ( isplayer( entities[ i ] ) )
			{
				entity dodamage( entities[ i ].health * 2, triggers[ triggertouched ].origin + ( 0, 0, 1 ), triggers[ triggertouched ], triggers[ triggertouched ], 0, "MOD_HIT_BY_OBJECT", 0, "hydro_water_mp" );
			}
			else
			{
				entities[ i ] dodamage( entity.health * 2, triggers[ triggertouched ].origin + ( 0, 0, 1 ), triggers[ triggertouched ], triggers[ triggertouched ], 0, "MOD_CRUSH" );
			}
			if ( isplayer( entities[ i ] ) )
			{
				entities[ i ] playlocalsound( "mpl_splash_death" );
			}
			i++;
		}
	}
}

getwatcherforweapon( weapname ) //checked partially changed to match cerberus output
{
	if ( !isDefined( self ) )
	{
		return undefined;
	}
	if ( !isplayer( self ) )
	{
		return undefined;
	}
	for ( i = 0; i < self.weaponobjectwatcherarray.size; i++ )
	{
		if ( self.weaponobjectwatcherarray[ i ].weapon != weapname )
		{
		}
		else
		{
			return self.weaponobjectwatcherarray[ i ];
		}
	}
	return undefined;
}

removeobjectsondemovertime() //checked changed to match cerberus output
{
	if ( level.gametype == "dem" )
	{
		if ( isDefined( game[ "overtime_round" ] ) )
		{
			objects = getentarray( "delete_dem_overtime", "script_noteworthy" );
			if ( isDefined( objects ) )
			{
				for ( i = 0; i < objects.size; i++ ) 
				{
					objects[ i ] delete();
				}
			}
		}
	}
}

