class CfgVehicles
{
    class Flag_White_F;
    class GVAR(red): Flag_White_F
    {
        author="$STR_cvo_Author";

        editorPreview="\A3\EditorPreviews_F\Data\CfgVehicles\Flag_White_F.jpg";
        _generalMacro=QGVAR(red);
        displayName="STR_CVO_flag_display";
        class EventHandlers
        {
            init=QUOTE((_this select 0) setFlagTexture QUOTE(QPATHTOF(data\flag_voron_red_512.paa)));
        };
    };
};
