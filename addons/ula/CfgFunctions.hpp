class CfgFunctions
{
	class ADDON          // Tag
	{
		class COMPONENT           // Category
		{
            file = PATH_TO_FUNC;
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