class CfgMarkerClasses
{
    class CVO
    {
        displayName = PREFIX;
    };
};
class CfgMarkers
{
    // Flags
    class SPVAR(base_marker)
    {
        icon = "";
        texture = "";
        color[] = { 1, 1, 1, 1 };
        markerClass = "CVO";
        scope = 0;
        size = 64;
        shadow = 0;						// 1 = shadow, 0 = no shadow
    };
    class SPVAR(flag_red): SPVAR(base_marker)
    {
        name = "CVO Flag Red";                              // name used in the Editor and other UIs
        icon = QPATHTOF(data\CfgMarkers\flag_voron_red-square-512.paa);		// marker icon
        texture = QPATHTOF(data\CfgMarkers\flag_voron_red-square-512.paa);	// ?
        scope = 1;
    };
    class SPVAR(flag_olive): SPVAR(flag_red)
    {
        name = "CVO Flag Olive";			                                    // name used in the Editor and other UIs
        icon = QPATHTOF(data\CfgMarkers\flag_voron_olive-square-512.paa);		// marker icon
        texture = QPATHTOF(data\CfgMarkers\flag_voron_olive-square-512.paa);	// ?
    };


    // Black Raven
    class SPVAR(raven): SPVAR(flag_red)
    {
        name = "CVO Raven";			                                    // name used in the Editor and other UIs
        icon = QPATHTOF(data\Raven_Voron_512.paa);		// marker icon
        texture = QPATHTOF(data\Raven_Voron_512.paa);	// ?
        shadow = 1;
    };
};