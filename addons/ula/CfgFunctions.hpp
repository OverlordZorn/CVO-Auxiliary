class CfgFunctions
{
	class cvo_ula          // Tag
	{
		class UnhideLayerAction           // Category
		{
            file = "z\cvo\addons\ula\functions";
            class preInit { preInit = 1; };
            
            class register {};
            class init_layer {};

            class add_action {};

            class reveal_object {};
            class play_sound {};

            class action_statement {};
            class action_condition {};
            
		};
	}; 
};