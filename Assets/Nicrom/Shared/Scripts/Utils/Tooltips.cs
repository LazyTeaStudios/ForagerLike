namespace Nicrom
{
    public static class Tooltips
    {
        public static string gvTime                         = "Specifies the source of the time counter. This toggle is not a shader feature and doesn't increase the number of shader variants.";
        public static string gvAmplitudeScale               = "Specifies the source of the amplitude scale. This toggle is not a shader feature and doesn't increase the number of shader variants.";
        public static string gvBendingScale                 = "Specifies the source of the bending scale. This toggle is not a shader feature and doesn't increase the number of shader variants.";
        public static string gvDirectionAngle               = "Specifies the source of the direction angle. This toggle is not a shader feature and doesn't increase the number of shader variants.";

        public static string mmToggle                       = "Enables/Disables the main motion.";
        public static string mmSpeed                        = "Controls the speed of the main motion.";
        public static string mmAmplitude                    = "Controls the amplitude of the main motion.";
        public static string mmAmplitudeOffset              = "Controls the offset value that is added to the main motion Ampliture. The offset value is multiplied with a texture noise value.";
        public static string mmBending                      = "Controls the bending applied to the model.";
        public static string mmBendingOffset                = "Controls the offset value that is added to the bending.";
        public static string mmPhaseShiftScale              = "Controls the scale of the phase shift. The phase shift adds variation to the main motion.";
        public static string mmDirAngle                     = "Controls the direction of the main motion.";
        public static string mmDirShift                     = "Controls the direction shift angle of the main motion.";
        public static string mmDirShiftOffset               = "Controls the offset value that is added to the Direction Shift. The offset value is multiplied with a texture noise value.";
        public static string mmDirShiftSpeed                = "Controls the speed at which the direction of the main motion changes.";
        public static string mmDirShiftNoiseScale           = "Controls the scale of the noise that is used as a phase shift for the direction shift.";
        public static string mmSineWaveLength               = "Controls the length of the main motion sine wave.";
        public static string mmObjectHeightSource           = "Specifies the source of the object height.";
        public static string mmObjectHeight                 = "The height of the tallest object that uses this material.";

        public static string dm1Toggle                      = "Enables/Disables detail motion 1.";
        public static string dm1Speed                       = "Controls the speed of detail motion 1.";
        public static string dm1Amplitude                   = "Controls the amplitude of detail motion 1.";
        public static string dm1Length                      = "The length of the longest branch/leaf.";

        public static string dm2Toggle                      = "Enables/Disables detail motion 2.";
        public static string dm2Speed                       = "Controls the speed of detail motion 2.";
        public static string dm2Amplitude                   = "Controls the amplitude of detail motion 2.";
        public static string dm2Radius                      = "The radius on the XZ axis of the object. If the model is a cluster of objects, the radius of an individual object should be used.";

        public static string grassColorBlendingMode_MA3C = "Color 1A and 2A are blended using Mask 2. The new color is blended with Color 1B using Mask 1.";
        public static string grassColorBlendingMode_MA4C = "Color 1A and 1B, as well as Color 2A and 2B, are blended using Mask 1. The 2 new colors are blended using Mask 2.";
        public static string grassColorBlendingMode_MB3C = "Color 1A and 1B are blended using Mask 3. The new color is blended with Color 2A using Mask 1.";
        public static string grassColorBlendingMode_MB4C = "Color 1A and 1B are blended using Mask 3. Color 2A and 2B are blended using Mask 2. The 2 new colors are blended using Mask 1.";
        public static string windStrength = "Controls the strength of the wind. When the strength is smaller than 1, the motion multipliers can have a value between 0 and min value of the Range sliders. "
            + "When the wind strength is 1 or bigger, the motion multipliers can have a value between min and max values of the Range sliders. " 
            + "Changing the wind strength in editor will result in motion jitter. At run time the motion will be smooth even when the strength of the wind changes.";
        public static string windDirection = "Controls the direction of the wind. 0 = North, 90 = East, 180 = South and 270 = West.";
    }
}