namespace ao.delta;

using {
    cuid,
    managed
} from '@sap/cds/common';

aspect nameable {
    name        : String(255);
    description : String(1000);
}


entity DesignVersions : cuid, nameable, managed {

    components : Composition of many StructureElements on components.designVersion = $self;

}


entity StructureElements : cuid, nameable, managed {
    matNr         : String(255);
    designVersion : Association to DesignVersions;
    parent        : Association to StructureElements;
    children      : Composition of many StructureElements on children.parent = $self;
    units         : Composition of many UnitEntries on units.structureElement = $self;
}

entity UnitEntries : cuid, nameable, managed {
    structureElement : Association to StructureElements;
    unit             : Association to Units;
    unitAction       : String(255); // INSTALL, REMOVE, TRANSFER
    finIndicator     : String(255); // For PG&E it is called AIN
    quantity         : Double;

}

entity Units : cuid, nameable, managed {
    matNr        : String(255);
    s4CuId       : String(255);
    s4CuType     : String(255);
    s4TaskListId : String(255);
    s4ObjNr      : String(255);
}
