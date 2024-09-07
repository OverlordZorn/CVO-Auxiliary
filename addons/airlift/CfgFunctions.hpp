class CfgFunctions
{
	class cvo_airlift            // Tag
	{
		class airlift           // Category
		{
			file = "z\cvo_aux\addons\airlift\functions";

            class testing { recompile = 1; postInit = 1; };

			class init_controller	{};
            class register {};

            class speedLimiter {};
            class protect {};

		};
	};
};