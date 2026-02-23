using {ao.delta.estimate as e} from '../db/estimate';


@(path: 'estimate')
service EstimatingService {

    // Returns an estimate instance id
    action startEstimateForDesignVersion(designVersionId: UUID) returns UUID;

    entity EstimateInstance   as projection on e.EstimateInstance;
    entity EstimateComponents as projection on e.EstimateComponents;
}