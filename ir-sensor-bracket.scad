function centering_offset (outer_dimension, inner_dimension) =
(outer_dimension - inner_dimension) / 2;

module irsensor_bracket (
    screw_bracket_width = 8.65,
    plug_width = 10.4,
    inner_breadth = 13.45,
    inner_length = 29.85,
    depth = 10,
    wall_thickness = 1,
)
{
    outer_length = inner_length + wall_thickness * 2;
    outer_breadth = inner_breadth + wall_thickness * 2;

    difference () {
        // main body
        cube (size=[outer_length, outer_breadth, depth + wall_thickness]);

        // screw bracket holes
        translate ([
                -0.1,
                centering_offset (outer_breadth, screw_bracket_width),
                wall_thickness
            ])
        cube ([outer_length + 0.2, screw_bracket_width, depth + 0.1]);

        // hole for electric plug
        translate ([
                centering_offset (outer_length, plug_width),
                outer_breadth - wall_thickness - 0.1,
                wall_thickness
            ])
        cube ([plug_width, wall_thickness + 0.2, depth + 0.1]);

        // hole for the ir sensor itself
        translate ([wall_thickness, wall_thickness, wall_thickness])
        cube ([inner_length, inner_breadth, depth + 0.1]);
    }
}

irsensor_bracket ();
