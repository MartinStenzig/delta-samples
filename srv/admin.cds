using {ao.delta.core as c} from '../db/core';
using {ao.delta.design as d} from '../db/design';
using {ao.delta.estimate as e} from '../db/estimate';

service AdminService {
    entity DesignVersions     as projection on d.DesignVersions;
    entity StructureElements  as projection on d.StructureElements;
    entity UnitEntries        as projection on d.UnitEntries;
    entity Units              as projection on c.Units;
    entity EstimateInstance   as projection on e.EstimateInstance;
    entity EstimateComponents as projection on e.EstimateComponents;
}
