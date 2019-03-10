    // below updates ther servers ini file of your appearance 
    buffer_seek(global.buffer, buffer_seek_start, 0);
    buffer_write(global.buffer, buffer_u8, 15);
    buffer_write(global.buffer, buffer_string, global.playerUsername);
    buffer_write(global.buffer, buffer_u16, global.hairCustom);
    buffer_write(global.buffer, buffer_u16, global.outfitTopCustom);
        buffer_write(global.buffer, buffer_u16, global.outfitBottomCustom);
    buffer_write(global.buffer, buffer_u8, global.skinCustom);
    buffer_write(global.buffer, buffer_u16, global.diaperCustom);
    buffer_write(global.buffer, buffer_u32, global.skinCol);
    buffer_write(global.buffer, buffer_u32, global.hairCol);
    buffer_write(global.buffer, buffer_u32, global.outfitTopCol);
        buffer_write(global.buffer, buffer_u32, global.outfitBottomCol);
    network_send_packet(obClient.socket, global.buffer, buffer_tell(global.buffer));
