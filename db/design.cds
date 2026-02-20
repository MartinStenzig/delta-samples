namespace ao.delta.design;

using {
    cuid,
    managed
} from '@sap/cds/common';

using {
    ao.delta.core.Units    as Units,
    ao.delta.core.nameable as nameable
} from './core';


entity DesignVersions : cuid, nameable, managed {

    components : Composition of many StructureElements
                     on components.designVersion = $self;

}


entity StructureElements : cuid, nameable, managed {
    matNr         : String(255);
    designVersion : Association to DesignVersions;
    parent        : Association to StructureElements;
    children      : Composition of many StructureElements
                        on children.parent = $self;
    units         : Composition of many UnitEntries
                        on units.structureElement = $self;
}

entity UnitEntries : cuid, nameable, managed {
    structureElement : Association to StructureElements;
    unit             : Association to Units;
    unitAction       : String(255); // INSTALL, REMOVE, TRANSFER
    finIndicator     : String(255); // For PG&E it is called AIN
    quantity         : Double;
    jointFacilities  : Boolean;

}
