namespace ao.delta.estimate;

using {
    cuid,
    managed
} from '@sap/cds/common';
using {
    ao.delta.design.DesignVersions as dvs,
    ao.delta.design.UnitEntries    as ues
} from './design';

entity EstimateInstance : cuid, managed {
    designVersion : Association to dvs;
    asOfDate      : Date; // the date for which the estimate is valid, e.g. the date of the estimate run
    components    : Composition of many EstimateComponents
                        on components.estimate = $self;
}


entity EstimateComponents : cuid, managed {
    estimate                : Association to EstimateInstance;
    unitEntry               : Association to ues;
    description             : String(1000);
    value                   : Double; // value of the estimate component in the given currency
    currency                : String(3); // ISO currency code, e.g. USD, EUR, etc.


    version                 : String(255); // version of the estimate component, e.g. "initial", "revised", etc.
    capitalExpense          : String(255); // CAPEX or OPEX
    costRevenue             : String(255); // COST or REVENUE
    targetCostObjective     : String(255); // e.g. "WBS", "NETWORK ACTIVITY", etc.

    fercAccount             : String(255); // FERC account for reporting

    companyCode             : String(4); //
    costElement             : String(255); // => can then be summarized into value categories like material, labor, etc. for reporting
    costElementDescription  : String(255);
    valueCategory           : String(255); // e.g. "Material", "Labor", "Other", etc. for reporting and analysis purposes

    sapWorkOrderId          : String(255); // if applicable, the SAP work order ID associated with this estimate component
    sapWorkOrderOperationId : String(255); // if applicable, the SAP work order operation ID associated with this estimate component
    sapNetworkId            : String(255); // if applicable, the SAP network ID associated with this estimate component
    sapNetworkActivityId    : String(255); // if applicable, the SAP network activity ID associated with this estimate component
    sapWbsElementId         : String(255); // if applicable, the SAP WBS element ID associated with this estimate component


}

entity RetirementRecords : EstimateComponents {

    financialAssetClass   : String(255); // Pole (Mass asset), Distinct Building
    financialAssetId      : String(255); // i.e. SAP FAA asset ID or PowerPlan Work Order ID???
    assetInstallationYear : Integer; // Year the asset was installed

}
