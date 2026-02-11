using {ao.delta as d} from '../db/core';

service AdminService {
    entity DesignVersions    as projection on d.DesignVersions;
    entity StructureElements as projection on d.StructureElements;
    entity UnitEntries       as projection on d.UnitEntries;
    entity Units             as projection on d.Units;
}
