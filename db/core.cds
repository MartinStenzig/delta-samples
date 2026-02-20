namespace ao.delta.core;

using {
    cuid,
    managed
} from '@sap/cds/common';

aspect nameable {
    name        : String(255);
    description : String(1000);
}


entity Units : cuid, nameable, managed {
    matNr        : String(255);
    s4CuId       : String(255);
    s4CuType     : String(255);
    s4TaskListId : String(255);
    s4ObjNr      : String(255);
}
