/**
 *
 * Copyright 2011, Moxiecode Systems AB
 * Released under GPL License.
 *
 * License: http://www.plupload.com/license
 * Contributing: http://www.plupload.com/contributing
 */

package com.mxi {

import flash.utils.ByteArray;
import flash.utils.Endian;

public class BinaryReader extends ByteArray {

    public function init(binData:ByteArray):void {
        clear();
        endian = Endian.BIG_ENDIAN;
        writeBytes(binData);
    }

    public function II(...args):* {
        if (!args.length)
            return endian == Endian.LITTLE_ENDIAN ? true : false;
        else
            endian = args[0] == true ? Endian.LITTLE_ENDIAN : Endian.BIG_ENDIAN;
    }

    public function SEGMENT(...args):ByteArray {
        var seg:ByteArray = new ByteArray();

        switch (args.length) {

            case 1:
                position = args[0];
                readBytes(seg, 0);
                break;

            case 2:
                position = args[0];
                readBytes(seg, 0, args[1]);
                break;

            case 3:
                position = args[0] + args[1];
                readBytes(seg);
                position = args[0];
                writeBytes(args[2]);
                writeBytes(seg);
                break;

            default:
                position = 0;
                readBytes(seg, 0, length);
        }

        return seg;
    }

    public function BYTE(idx:int):uint {
        position = idx;
        return readUnsignedByte();
    }

    public function SHORT(idx:int):uint {
        position = idx;
        return readUnsignedShort();
    }

    public function LONG(idx:int, ...args):* {
        position = idx;
        if (!args.length)
            return readUnsignedInt();
        else
            writeUnsignedInt(args[0]);
    }

    public function SLONG(idx:uint):int {
        position = idx;
        return readInt();
    }

    public function STRING(idx:uint, size:uint):String {
        position = idx;
        return readUTFBytes(size);
    }


}


}
