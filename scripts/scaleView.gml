var scale = argument0;
if (scale) {
    var center_x = view_xview + view_wview/2;
    var center_y = view_yview + view_hview/2;
    view_wview = clamp(view_wview*scale, VIEW_WVIEW/VIEW_ZOOM_MAX, VIEW_WVIEW/VIEW_ZOOM_MIN);
    view_hview = clamp(view_hview*scale, VIEW_HVIEW/VIEW_ZOOM_MAX, VIEW_HVIEW/VIEW_ZOOM_MIN);
    view_xview = center_x - view_wview/2;
    view_yview = center_y - view_hview/2;
}
