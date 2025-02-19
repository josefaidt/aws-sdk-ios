//
// Copyright 2010-2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSLocationResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSLocationResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSLocationResources

+ (instancetype)sharedInstance {
    static AWSLocationResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSLocationResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2020-11-19\",\
    \"endpointPrefix\":\"geo\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"Amazon Location Service\",\
    \"serviceId\":\"Location\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"geo\",\
    \"uid\":\"location-2020-11-19\"\
  },\
  \"operations\":{\
    \"AssociateTrackerConsumer\":{\
      \"name\":\"AssociateTrackerConsumer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/consumers\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"AssociateTrackerConsumerRequest\"},\
      \"output\":{\"shape\":\"AssociateTrackerConsumerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates an association between a geofence collection and a tracker resource. This allows the tracker resource to communicate location data to the linked geofence collection. </p> <p>You can associate up to five geofence collections to each tracker resource.</p> <note> <p>Currently not supported â Cross-account configurations, such as creating associations between a tracker resource in one account and a geofence collection in another account.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"BatchDeleteDevicePositionHistory\":{\
      \"name\":\"BatchDeleteDevicePositionHistory\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/delete-positions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"BatchDeleteDevicePositionHistoryRequest\"},\
      \"output\":{\"shape\":\"BatchDeleteDevicePositionHistoryResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes the position history of one or more devices from a tracker resource.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"BatchDeleteGeofence\":{\
      \"name\":\"BatchDeleteGeofence\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}/delete-geofences\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"BatchDeleteGeofenceRequest\"},\
      \"output\":{\"shape\":\"BatchDeleteGeofenceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a batch of geofences from a geofence collection.</p> <note> <p>This operation deletes the resource permanently.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"BatchEvaluateGeofences\":{\
      \"name\":\"BatchEvaluateGeofences\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}/positions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"BatchEvaluateGeofencesRequest\"},\
      \"output\":{\"shape\":\"BatchEvaluateGeofencesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Evaluates device positions against the geofence geometries from a given geofence collection.</p> <p>This operation always returns an empty response because geofences are asynchronously evaluated. The evaluation determines if the device has entered or exited a geofenced area, and then publishes one of the following events to Amazon EventBridge:</p> <ul> <li> <p> <code>ENTER</code> if Amazon Location determines that the tracked device has entered a geofenced area.</p> </li> <li> <p> <code>EXIT</code> if Amazon Location determines that the tracked device has exited a geofenced area.</p> </li> </ul> <note> <p>The last geofence that a device was observed within is tracked for 30 days after the most recent device position update.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"BatchGetDevicePosition\":{\
      \"name\":\"BatchGetDevicePosition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/get-positions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"BatchGetDevicePositionRequest\"},\
      \"output\":{\"shape\":\"BatchGetDevicePositionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists the latest device positions for requested devices.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"BatchPutGeofence\":{\
      \"name\":\"BatchPutGeofence\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}/put-geofences\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"BatchPutGeofenceRequest\"},\
      \"output\":{\"shape\":\"BatchPutGeofenceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>A batch request for storing geofence geometries into a given geofence collection, or updates the geometry of an existing geofence if a geofence ID is included in the request.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"BatchUpdateDevicePosition\":{\
      \"name\":\"BatchUpdateDevicePosition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/positions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"BatchUpdateDevicePositionRequest\"},\
      \"output\":{\"shape\":\"BatchUpdateDevicePositionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Uploads position update data for one or more devices to a tracker resource. Amazon Location uses the data when reporting the last known device position and position history.</p> <note> <p>Only one position update is stored per sample time. Location data is sampled at a fixed rate of one position per 30-second interval and retained for 30 days before it's deleted.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"CalculateRoute\":{\
      \"name\":\"CalculateRoute\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routes/v0/calculators/{CalculatorName}/calculate/route\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"CalculateRouteRequest\"},\
      \"output\":{\"shape\":\"CalculateRouteResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p> <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html\\\">Calculates a route</a> given the following required parameters: <code>DeparturePostiton</code> and <code>DestinationPosition</code>. Requires that you first <a href=\\\"https://docs.aws.amazon.com/location-routes/latest/APIReference/API_CreateRouteCalculator.html\\\">create a route calculator resource</a> </p> <p>By default, a request that doesn't specify a departure time uses the best time of day to travel with the best traffic conditions when calculating the route.</p> <p>Additional options include:</p> <ul> <li> <p> <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#departure-time\\\">Specifying a departure time</a> using either <code>DepartureTime</code> or <code>DepartureNow</code>. This calculates a route based on predictive traffic data at the given time. </p> <note> <p>You can't specify both <code>DepartureTime</code> and <code>DepartureNow</code> in a single request. Specifying both parameters returns an error message.</p> </note> </li> <li> <p> <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#travel-mode\\\">Specifying a travel mode</a> using TravelMode. This lets you specify an additional route preference such as <code>CarModeOptions</code> if traveling by <code>Car</code>, or <code>TruckModeOptions</code> if traveling by <code>Truck</code>.</p> </li> </ul> <p> </p>\",\
      \"endpoint\":{\"hostPrefix\":\"routes.\"}\
    },\
    \"CreateGeofenceCollection\":{\
      \"name\":\"CreateGeofenceCollection\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/geofencing/v0/collections\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"CreateGeofenceCollectionRequest\"},\
      \"output\":{\"shape\":\"CreateGeofenceCollectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a geofence collection, which manages and stores geofences.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"},\
      \"idempotent\":true\
    },\
    \"CreateMap\":{\
      \"name\":\"CreateMap\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/maps/v0/maps\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"CreateMapRequest\"},\
      \"output\":{\"shape\":\"CreateMapResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a map resource in your AWS account, which provides map tiles of different styles sourced from global location data providers.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"},\
      \"idempotent\":true\
    },\
    \"CreatePlaceIndex\":{\
      \"name\":\"CreatePlaceIndex\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/places/v0/indexes\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"CreatePlaceIndexRequest\"},\
      \"output\":{\"shape\":\"CreatePlaceIndexResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a place index resource in your AWS account, which supports functions with geospatial data sourced from your chosen data provider.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"places.\"},\
      \"idempotent\":true\
    },\
    \"CreateRouteCalculator\":{\
      \"name\":\"CreateRouteCalculator\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routes/v0/calculators\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"CreateRouteCalculatorRequest\"},\
      \"output\":{\"shape\":\"CreateRouteCalculatorResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a route calculator resource in your AWS account.</p> <p>You can send requests to a route calculator resource to estimate travel time, distance, and get directions. A route calculator sources traffic and road network data from your chosen data provider.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"routes.\"},\
      \"idempotent\":true\
    },\
    \"CreateTracker\":{\
      \"name\":\"CreateTracker\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/trackers\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"CreateTrackerRequest\"},\
      \"output\":{\"shape\":\"CreateTrackerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a tracker resource in your AWS account, which lets you retrieve current and historical location of devices.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"},\
      \"idempotent\":true\
    },\
    \"DeleteGeofenceCollection\":{\
      \"name\":\"DeleteGeofenceCollection\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DeleteGeofenceCollectionRequest\"},\
      \"output\":{\"shape\":\"DeleteGeofenceCollectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a geofence collection from your AWS account.</p> <note> <p>This operation deletes the resource permanently. If the geofence collection is the target of a tracker resource, the devices will no longer be monitored.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"},\
      \"idempotent\":true\
    },\
    \"DeleteMap\":{\
      \"name\":\"DeleteMap\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/maps/v0/maps/{MapName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DeleteMapRequest\"},\
      \"output\":{\"shape\":\"DeleteMapResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a map resource from your AWS account.</p> <note> <p>This operation deletes the resource permanently. If the map is being used in an application, the map may not render.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"},\
      \"idempotent\":true\
    },\
    \"DeletePlaceIndex\":{\
      \"name\":\"DeletePlaceIndex\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/places/v0/indexes/{IndexName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DeletePlaceIndexRequest\"},\
      \"output\":{\"shape\":\"DeletePlaceIndexResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a place index resource from your AWS account.</p> <note> <p>This operation deletes the resource permanently.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"places.\"},\
      \"idempotent\":true\
    },\
    \"DeleteRouteCalculator\":{\
      \"name\":\"DeleteRouteCalculator\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/routes/v0/calculators/{CalculatorName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DeleteRouteCalculatorRequest\"},\
      \"output\":{\"shape\":\"DeleteRouteCalculatorResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a route calculator resource from your AWS account.</p> <note> <p>This operation deletes the resource permanently.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"routes.\"},\
      \"idempotent\":true\
    },\
    \"DeleteTracker\":{\
      \"name\":\"DeleteTracker\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DeleteTrackerRequest\"},\
      \"output\":{\"shape\":\"DeleteTrackerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a tracker resource from your AWS account.</p> <note> <p>This operation deletes the resource permanently. If the tracker resource is in use, you may encounter an error. Make sure that the target resource isn't a dependency for your applications.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"},\
      \"idempotent\":true\
    },\
    \"DescribeGeofenceCollection\":{\
      \"name\":\"DescribeGeofenceCollection\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeGeofenceCollectionRequest\"},\
      \"output\":{\"shape\":\"DescribeGeofenceCollectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the geofence collection details.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"DescribeMap\":{\
      \"name\":\"DescribeMap\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/maps/v0/maps/{MapName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeMapRequest\"},\
      \"output\":{\"shape\":\"DescribeMapResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the map resource details.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"}\
    },\
    \"DescribePlaceIndex\":{\
      \"name\":\"DescribePlaceIndex\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/places/v0/indexes/{IndexName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribePlaceIndexRequest\"},\
      \"output\":{\"shape\":\"DescribePlaceIndexResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the place index resource details.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"places.\"}\
    },\
    \"DescribeRouteCalculator\":{\
      \"name\":\"DescribeRouteCalculator\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/routes/v0/calculators/{CalculatorName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeRouteCalculatorRequest\"},\
      \"output\":{\"shape\":\"DescribeRouteCalculatorResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the route calculator resource details.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"routes.\"}\
    },\
    \"DescribeTracker\":{\
      \"name\":\"DescribeTracker\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeTrackerRequest\"},\
      \"output\":{\"shape\":\"DescribeTrackerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the tracker resource details.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"DisassociateTrackerConsumer\":{\
      \"name\":\"DisassociateTrackerConsumer\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/consumers/{ConsumerArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DisassociateTrackerConsumerRequest\"},\
      \"output\":{\"shape\":\"DisassociateTrackerConsumerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Removes the association between a tracker resource and a geofence collection.</p> <note> <p>Once you unlink a tracker resource from a geofence collection, the tracker positions will no longer be automatically evaluated against geofences.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"GetDevicePosition\":{\
      \"name\":\"GetDevicePosition\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/devices/{DeviceId}/positions/latest\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetDevicePositionRequest\"},\
      \"output\":{\"shape\":\"GetDevicePositionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a device's most recent position according to its sample time.</p> <note> <p>Device positions are deleted after 30 days.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"GetDevicePositionHistory\":{\
      \"name\":\"GetDevicePositionHistory\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/devices/{DeviceId}/list-positions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetDevicePositionHistoryRequest\"},\
      \"output\":{\"shape\":\"GetDevicePositionHistoryResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the device position history from a tracker resource within a specified range of time.</p> <note> <p>Device positions are deleted after 30 days.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"GetGeofence\":{\
      \"name\":\"GetGeofence\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}/geofences/{GeofenceId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetGeofenceRequest\"},\
      \"output\":{\"shape\":\"GetGeofenceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the geofence details from a geofence collection.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"GetMapGlyphs\":{\
      \"name\":\"GetMapGlyphs\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/maps/v0/maps/{MapName}/glyphs/{FontStack}/{FontUnicodeRange}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetMapGlyphsRequest\"},\
      \"output\":{\"shape\":\"GetMapGlyphsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves glyphs used to display labels on a map.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"}\
    },\
    \"GetMapSprites\":{\
      \"name\":\"GetMapSprites\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/maps/v0/maps/{MapName}/sprites/{FileName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetMapSpritesRequest\"},\
      \"output\":{\"shape\":\"GetMapSpritesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the sprite sheet corresponding to a map resource. The sprite sheet is a PNG image paired with a JSON document describing the offsets of individual icons that will be displayed on a rendered map.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"}\
    },\
    \"GetMapStyleDescriptor\":{\
      \"name\":\"GetMapStyleDescriptor\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/maps/v0/maps/{MapName}/style-descriptor\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetMapStyleDescriptorRequest\"},\
      \"output\":{\"shape\":\"GetMapStyleDescriptorResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the map style descriptor from a map resource. </p> <p>The style descriptor contains speciï¬cations on how features render on a map. For example, what data to display, what order to display the data in, and the style for the data. Style descriptors follow the Mapbox Style Specification.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"}\
    },\
    \"GetMapTile\":{\
      \"name\":\"GetMapTile\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/maps/v0/maps/{MapName}/tiles/{Z}/{X}/{Y}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetMapTileRequest\"},\
      \"output\":{\"shape\":\"GetMapTileResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a vector data tile from the map resource. Map tiles are used by clients to render a map. they're addressed using a grid arrangement with an X coordinate, Y coordinate, and Z (zoom) level. </p> <p>The origin (0, 0) is the top left of the map. Increasing the zoom level by 1 doubles both the X and Y dimensions, so a tile containing data for the entire world at (0/0/0) will be split into 4 tiles at zoom 1 (1/0/0, 1/0/1, 1/1/0, 1/1/1).</p>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"}\
    },\
    \"ListDevicePositions\":{\
      \"name\":\"ListDevicePositions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/list-positions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListDevicePositionsRequest\"},\
      \"output\":{\"shape\":\"ListDevicePositionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>A batch request to retrieve all device positions.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"ListGeofenceCollections\":{\
      \"name\":\"ListGeofenceCollections\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/geofencing/v0/list-collections\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListGeofenceCollectionsRequest\"},\
      \"output\":{\"shape\":\"ListGeofenceCollectionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists geofence collections in your AWS account.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"ListGeofences\":{\
      \"name\":\"ListGeofences\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}/list-geofences\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListGeofencesRequest\"},\
      \"output\":{\"shape\":\"ListGeofencesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists geofences stored in a given geofence collection.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"ListMaps\":{\
      \"name\":\"ListMaps\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/maps/v0/list-maps\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListMapsRequest\"},\
      \"output\":{\"shape\":\"ListMapsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists map resources in your AWS account.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"}\
    },\
    \"ListPlaceIndexes\":{\
      \"name\":\"ListPlaceIndexes\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/places/v0/list-indexes\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListPlaceIndexesRequest\"},\
      \"output\":{\"shape\":\"ListPlaceIndexesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists place index resources in your AWS account.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"places.\"}\
    },\
    \"ListRouteCalculators\":{\
      \"name\":\"ListRouteCalculators\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/routes/v0/list-calculators\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListRouteCalculatorsRequest\"},\
      \"output\":{\"shape\":\"ListRouteCalculatorsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists route calculator resources in your AWS account.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"routes.\"}\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tags/{ResourceArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of tags that are applied to the specified Amazon Location resource.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"metadata.\"}\
    },\
    \"ListTrackerConsumers\":{\
      \"name\":\"ListTrackerConsumers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}/list-consumers\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListTrackerConsumersRequest\"},\
      \"output\":{\"shape\":\"ListTrackerConsumersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists geofence collections currently associated to the given tracker resource.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"ListTrackers\":{\
      \"name\":\"ListTrackers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tracking/v0/list-trackers\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListTrackersRequest\"},\
      \"output\":{\"shape\":\"ListTrackersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Lists tracker resources in your AWS account.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"}\
    },\
    \"PutGeofence\":{\
      \"name\":\"PutGeofence\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}/geofences/{GeofenceId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"PutGeofenceRequest\"},\
      \"output\":{\"shape\":\"PutGeofenceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Stores a geofence geometry in a given geofence collection, or updates the geometry of an existing geofence if a geofence ID is included in the request. </p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"}\
    },\
    \"SearchPlaceIndexForPosition\":{\
      \"name\":\"SearchPlaceIndexForPosition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/places/v0/indexes/{IndexName}/search/position\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"SearchPlaceIndexForPositionRequest\"},\
      \"output\":{\"shape\":\"SearchPlaceIndexForPositionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Reverse geocodes a given coordinate and returns a legible address. Allows you to search for Places or points of interest near a given position.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"places.\"}\
    },\
    \"SearchPlaceIndexForText\":{\
      \"name\":\"SearchPlaceIndexForText\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/places/v0/indexes/{IndexName}/search/text\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"SearchPlaceIndexForTextRequest\"},\
      \"output\":{\"shape\":\"SearchPlaceIndexForTextResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Geocodes free-form text, such as an address, name, city, or region to allow you to search for Places or points of interest. </p> <p>Includes the option to apply additional parameters to narrow your list of results.</p> <note> <p>You can search for places near a given position using <code>BiasPosition</code>, or filter results within a bounding box using <code>FilterBBox</code>. Providing both parameters simultaneously returns an error.</p> </note>\",\
      \"endpoint\":{\"hostPrefix\":\"places.\"}\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tags/{ResourceArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Assigns one or more tags (key-value pairs) to the specified Amazon Location Service resource.</p> <pre><code> &lt;p&gt;Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only resources with certain tag values.&lt;/p&gt; &lt;p&gt;You can use the &lt;code&gt;TagResource&lt;/code&gt; operation with an Amazon Location Service resource that already has tags. If you specify a new tag key for the resource, this tag is appended to the tags already associated with the resource. If you specify a tag key that's already associated with the resource, the new tag value that you specify replaces the previous value for that tag. &lt;/p&gt; &lt;p&gt;You can associate up to 50 tags with a resource.&lt;/p&gt; </code></pre>\",\
      \"endpoint\":{\"hostPrefix\":\"metadata.\"}\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/tags/{ResourceArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Removes one or more tags from the specified Amazon Location resource.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"metadata.\"},\
      \"idempotent\":true\
    },\
    \"UpdateGeofenceCollection\":{\
      \"name\":\"UpdateGeofenceCollection\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/geofencing/v0/collections/{CollectionName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateGeofenceCollectionRequest\"},\
      \"output\":{\"shape\":\"UpdateGeofenceCollectionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified properties of a given geofence collection.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"geofencing.\"},\
      \"idempotent\":true\
    },\
    \"UpdateMap\":{\
      \"name\":\"UpdateMap\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/maps/v0/maps/{MapName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateMapRequest\"},\
      \"output\":{\"shape\":\"UpdateMapResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified properties of a given map resource.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"maps.\"},\
      \"idempotent\":true\
    },\
    \"UpdatePlaceIndex\":{\
      \"name\":\"UpdatePlaceIndex\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/places/v0/indexes/{IndexName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdatePlaceIndexRequest\"},\
      \"output\":{\"shape\":\"UpdatePlaceIndexResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified properties of a given place index resource.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"places.\"},\
      \"idempotent\":true\
    },\
    \"UpdateRouteCalculator\":{\
      \"name\":\"UpdateRouteCalculator\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/routes/v0/calculators/{CalculatorName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateRouteCalculatorRequest\"},\
      \"output\":{\"shape\":\"UpdateRouteCalculatorResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified properties for a given route calculator resource.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"routes.\"},\
      \"idempotent\":true\
    },\
    \"UpdateTracker\":{\
      \"name\":\"UpdateTracker\",\
      \"http\":{\
        \"method\":\"PATCH\",\
        \"requestUri\":\"/tracking/v0/trackers/{TrackerName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateTrackerRequest\"},\
      \"output\":{\"shape\":\"UpdateTrackerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InternalServerException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Updates the specified properties of a given tracker resource.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"tracking.\"},\
      \"idempotent\":true\
    }\
  },\
  \"shapes\":{\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>The request was denied because of insufficient access or permissions. Check with an administrator to verify your permissions.</p>\",\
      \"error\":{\
        \"httpStatusCode\":403,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Arn\":{\
      \"type\":\"string\",\
      \"max\":1600,\
      \"min\":0,\
      \"pattern\":\"^arn(:[a-z0-9]+([.-][a-z0-9]+)*){2}(:([a-z0-9]+([.-][a-z0-9]+)*)?){2}:([^/].*)?$\"\
    },\
    \"ArnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Arn\"}\
    },\
    \"AssociateTrackerConsumerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConsumerArn\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"ConsumerArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the geofence collection to be associated to tracker resource. Used when you need to specify a resource across all AWS.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollectionConsumer</code> </p> </li> </ul>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource to be associated with a geofence collection.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"AssociateTrackerConsumerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"BatchDeleteDevicePositionHistoryError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceId\",\
        \"Error\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the device for this position.</p>\"\
        },\
        \"Error\":{\"shape\":\"BatchItemError\"}\
      },\
      \"documentation\":\"<p>Contains the tracker resource details.</p>\"\
    },\
    \"BatchDeleteDevicePositionHistoryErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDeleteDevicePositionHistoryError\"}\
    },\
    \"BatchDeleteDevicePositionHistoryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceIds\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"DeviceIds\":{\
          \"shape\":\"BatchDeleteDevicePositionHistoryRequestDeviceIdsList\",\
          \"documentation\":\"<p>Devices whose position history you want to delete.</p> <ul> <li> <p>For example, for two devices: <code>âDeviceIdsâ : [DeviceId1,DeviceId2]</code> </p> </li> </ul>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource to delete the device position history from.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"BatchDeleteDevicePositionHistoryRequestDeviceIdsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Id\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"BatchDeleteDevicePositionHistoryResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Errors\"],\
      \"members\":{\
        \"Errors\":{\
          \"shape\":\"BatchDeleteDevicePositionHistoryErrorList\",\
          \"documentation\":\"<p>Contains error details for each device history that failed to delete.</p>\"\
        }\
      }\
    },\
    \"BatchDeleteGeofenceError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Error\",\
        \"GeofenceId\"\
      ],\
      \"members\":{\
        \"Error\":{\
          \"shape\":\"BatchItemError\",\
          \"documentation\":\"<p>Contains details associated to the batch error.</p>\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The geofence associated with the error message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains error details for each geofence that failed to delete from the geofence collection.</p>\"\
    },\
    \"BatchDeleteGeofenceErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDeleteGeofenceError\"}\
    },\
    \"BatchDeleteGeofenceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionName\",\
        \"GeofenceIds\"\
      ],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The geofence collection storing the geofences to be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        },\
        \"GeofenceIds\":{\
          \"shape\":\"BatchDeleteGeofenceRequestGeofenceIdsList\",\
          \"documentation\":\"<p>The batch of geofences to be deleted.</p>\"\
        }\
      }\
    },\
    \"BatchDeleteGeofenceRequestGeofenceIdsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Id\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"BatchDeleteGeofenceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Errors\"],\
      \"members\":{\
        \"Errors\":{\
          \"shape\":\"BatchDeleteGeofenceErrorList\",\
          \"documentation\":\"<p>Contains error details for each geofence that failed to delete.</p>\"\
        }\
      }\
    },\
    \"BatchEvaluateGeofencesError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceId\",\
        \"Error\",\
        \"SampleTime\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The device associated with the position evaluation error.</p>\"\
        },\
        \"Error\":{\
          \"shape\":\"BatchItemError\",\
          \"documentation\":\"<p>Contains details associated to the batch error.</p>\"\
        },\
        \"SampleTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specifies a timestamp for when the error occurred in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains error details for each device that failed to evaluate its position against the geofences in a given geofence collection.</p>\"\
    },\
    \"BatchEvaluateGeofencesErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchEvaluateGeofencesError\"}\
    },\
    \"BatchEvaluateGeofencesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionName\",\
        \"DevicePositionUpdates\"\
      ],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The geofence collection used in evaluating the position of devices against its geofences.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        },\
        \"DevicePositionUpdates\":{\
          \"shape\":\"BatchEvaluateGeofencesRequestDevicePositionUpdatesList\",\
          \"documentation\":\"<p>Contains device details for each device to be evaluated against the given geofence collection.</p>\"\
        }\
      }\
    },\
    \"BatchEvaluateGeofencesRequestDevicePositionUpdatesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DevicePositionUpdate\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"BatchEvaluateGeofencesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Errors\"],\
      \"members\":{\
        \"Errors\":{\
          \"shape\":\"BatchEvaluateGeofencesErrorList\",\
          \"documentation\":\"<p>Contains error details for each device that failed to evaluate its position against the given geofence collection.</p>\"\
        }\
      }\
    },\
    \"BatchGetDevicePositionError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceId\",\
        \"Error\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the device that didn't return a position.</p>\"\
        },\
        \"Error\":{\
          \"shape\":\"BatchItemError\",\
          \"documentation\":\"<p>Contains details related to the error code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains error details for each device that didn't return a position.</p>\"\
    },\
    \"BatchGetDevicePositionErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchGetDevicePositionError\"}\
    },\
    \"BatchGetDevicePositionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceIds\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"DeviceIds\":{\
          \"shape\":\"BatchGetDevicePositionRequestDeviceIdsList\",\
          \"documentation\":\"<p>Devices whose position you want to retrieve.</p> <ul> <li> <p>For example, for two devices: <code>device-ids=DeviceId1&amp;device-ids=DeviceId2</code> </p> </li> </ul>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"BatchGetDevicePositionRequestTrackerNameString\",\
          \"documentation\":\"<p>The tracker resource retrieving the device position.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"BatchGetDevicePositionRequestDeviceIdsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Id\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"BatchGetDevicePositionRequestTrackerNameString\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"^[-._\\\\w]+$\"\
    },\
    \"BatchGetDevicePositionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DevicePositions\",\
        \"Errors\"\
      ],\
      \"members\":{\
        \"DevicePositions\":{\
          \"shape\":\"DevicePositionList\",\
          \"documentation\":\"<p>Contains device position details such as the device ID, position, and timestamps for when the position was received and sampled.</p>\"\
        },\
        \"Errors\":{\
          \"shape\":\"BatchGetDevicePositionErrorList\",\
          \"documentation\":\"<p>Contains error details for each device that failed to send its position to the tracker resource.</p>\"\
        }\
      }\
    },\
    \"BatchItemError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\
          \"shape\":\"BatchItemErrorCode\",\
          \"documentation\":\"<p>The error code associated with the batch request error.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A message with the reason for the batch request error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the batch request error details associated with the request.</p>\"\
    },\
    \"BatchItemErrorCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"AccessDeniedError\",\
        \"ConflictError\",\
        \"InternalServerError\",\
        \"ResourceNotFoundError\",\
        \"ThrottlingError\",\
        \"ValidationError\"\
      ]\
    },\
    \"BatchPutGeofenceError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Error\",\
        \"GeofenceId\"\
      ],\
      \"members\":{\
        \"Error\":{\
          \"shape\":\"BatchItemError\",\
          \"documentation\":\"<p>Contains details associated to the batch error.</p>\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The geofence associated with the error message.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains error details for each geofence that failed to be stored in a given geofence collection.</p>\"\
    },\
    \"BatchPutGeofenceErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchPutGeofenceError\"}\
    },\
    \"BatchPutGeofenceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionName\",\
        \"Entries\"\
      ],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The geofence collection storing the geofences.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        },\
        \"Entries\":{\
          \"shape\":\"BatchPutGeofenceRequestEntriesList\",\
          \"documentation\":\"<p>The batch of geofences to be stored in a geofence collection.</p>\"\
        }\
      }\
    },\
    \"BatchPutGeofenceRequestEntriesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchPutGeofenceRequestEntry\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"BatchPutGeofenceRequestEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"GeofenceId\",\
        \"Geometry\"\
      ],\
      \"members\":{\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The identifier for the geofence to be stored in a given geofence collection.</p>\"\
        },\
        \"Geometry\":{\
          \"shape\":\"GeofenceGeometry\",\
          \"documentation\":\"<p>Contains the polygon details to specify the position of the geofence.</p> <note> <p>Each <a href=\\\"https://docs.aws.amazon.com/location-geofences/latest/APIReference/API_GeofenceGeometry.html\\\">geofence polygon</a> can have a maximum of 1,000 vertices.</p> </note>\"\
        }\
      },\
      \"documentation\":\"<p>Contains geofence geometry details. </p>\"\
    },\
    \"BatchPutGeofenceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Errors\",\
        \"Successes\"\
      ],\
      \"members\":{\
        \"Errors\":{\
          \"shape\":\"BatchPutGeofenceErrorList\",\
          \"documentation\":\"<p>Contains additional error details for each geofence that failed to be stored in a geofence collection.</p>\"\
        },\
        \"Successes\":{\
          \"shape\":\"BatchPutGeofenceSuccessList\",\
          \"documentation\":\"<p>Contains each geofence that was successfully stored in a geofence collection.</p>\"\
        }\
      }\
    },\
    \"BatchPutGeofenceSuccess\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"GeofenceId\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence was stored in a geofence collection in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The geofence successfully stored in a geofence collection.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains a summary of each geofence that was successfully stored in a given geofence collection.</p>\"\
    },\
    \"BatchPutGeofenceSuccessList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchPutGeofenceSuccess\"}\
    },\
    \"BatchUpdateDevicePositionError\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceId\",\
        \"Error\",\
        \"SampleTime\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The device associated with the failed location update.</p>\"\
        },\
        \"Error\":{\
          \"shape\":\"BatchItemError\",\
          \"documentation\":\"<p>Contains details related to the error code such as the error code and error message.</p>\"\
        },\
        \"SampleTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp at which the device position was determined. Uses <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains error details for each device that failed to update its position.</p>\"\
    },\
    \"BatchUpdateDevicePositionErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchUpdateDevicePositionError\"}\
    },\
    \"BatchUpdateDevicePositionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrackerName\",\
        \"Updates\"\
      ],\
      \"members\":{\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        },\
        \"Updates\":{\
          \"shape\":\"BatchUpdateDevicePositionRequestUpdatesList\",\
          \"documentation\":\"<p>Contains the position update details for each device.</p>\"\
        }\
      }\
    },\
    \"BatchUpdateDevicePositionRequestUpdatesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DevicePositionUpdate\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"BatchUpdateDevicePositionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Errors\"],\
      \"members\":{\
        \"Errors\":{\
          \"shape\":\"BatchUpdateDevicePositionErrorList\",\
          \"documentation\":\"<p>Contains error details for each device that failed to update its position.</p>\"\
        }\
      }\
    },\
    \"Blob\":{\"type\":\"blob\"},\
    \"Boolean\":{\
      \"type\":\"boolean\",\
      \"box\":true\
    },\
    \"BoundingBox\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Double\"},\
      \"max\":4,\
      \"min\":4,\
      \"sensitive\":true\
    },\
    \"CalculateRouteCarModeOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvoidFerries\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Avoids ferries when calculating routes.</p> <p>Default Value: <code>false</code> </p> <p>Valid Values: <code>false</code> | <code>true</code> </p>\"\
        },\
        \"AvoidTolls\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Avoids tolls when calculating routes.</p> <p>Default Value: <code>false</code> </p> <p>Valid Values: <code>false</code> | <code>true</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains details about additional route preferences for requests that specify <code>TravelMode</code> as <code>Car</code>.</p>\"\
    },\
    \"CalculateRouteRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CalculatorName\",\
        \"DeparturePosition\",\
        \"DestinationPosition\"\
      ],\
      \"members\":{\
        \"CalculatorName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the route calculator resource that you want to use to calculate a route. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CalculatorName\"\
        },\
        \"CarModeOptions\":{\
          \"shape\":\"CalculateRouteCarModeOptions\",\
          \"documentation\":\"<p>Specifies route preferences when traveling by <code>Car</code>, such as avoiding routes that use ferries or tolls.</p> <p>Requirements: <code>TravelMode</code> must be specified as <code>Car</code>.</p>\"\
        },\
        \"DepartNow\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Sets the time of departure as the current time. Uses the current time to calculate a route. Otherwise, the best time of day to travel with the best traffic conditions is used to calculate the route.</p> <p>Default Value: <code>false</code> </p> <p>Valid Values: <code>false</code> | <code>true</code> </p>\"\
        },\
        \"DeparturePosition\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The start position for the route. Defined in <a href=\\\"https://earth-info.nga.mil/GandG/wgs84/index.html\\\">WGS 84</a> format: <code>[longitude, latitude]</code>.</p> <ul> <li> <p>For example, <code>[-123.115, 49.285]</code> </p> </li> </ul> <note> <p>If you specify a departure that's not located on a road, Amazon Location <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road\\\">moves the position to the nearest road</a>.</p> </note> <p>Valid Values: <code>[-180 to 180,-90 to 90]</code> </p>\"\
        },\
        \"DepartureTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specifies the desired time of departure. Uses the given time to calculate a route. Otherwise, the best time of day to travel with the best traffic conditions is used to calculate the route.</p> <note> <p>Setting a departure time in the past returns a <code>400 ValidationException</code> error.</p> </note> <ul> <li> <p>In <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. For example, <code>2020â07-2T12:15:20.000Z+01:00</code> </p> </li> </ul>\"\
        },\
        \"DestinationPosition\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The finish position for the route. Defined in <a href=\\\"https://earth-info.nga.mil/GandG/wgs84/index.html\\\">WGS 84</a> format: <code>[longitude, latitude]</code>.</p> <ul> <li> <p> For example, <code>[-122.339, 47.615]</code> </p> </li> </ul> <note> <p>If you specify a destination that's not located on a road, Amazon Location <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road\\\">moves the position to the nearest road</a>. </p> </note> <p>Valid Values: <code>[-180 to 180,-90 to 90]</code> </p>\"\
        },\
        \"DistanceUnit\":{\
          \"shape\":\"DistanceUnit\",\
          \"documentation\":\"<p>Set the unit system to specify the distance.</p> <p>Default Value: <code>Kilometers</code> </p>\"\
        },\
        \"IncludeLegGeometry\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Set to include the geometry details in the result for each path between a pair of positions.</p> <p>Default Value: <code>false</code> </p> <p>Valid Values: <code>false</code> | <code>true</code> </p>\"\
        },\
        \"TravelMode\":{\
          \"shape\":\"TravelMode\",\
          \"documentation\":\"<p>Specifies the mode of transport when calculating a route. Used in estimating the speed of travel and road compatibility.</p> <p>The <code>TravelMode</code> you specify determines how you specify route preferences: </p> <ul> <li> <p>If traveling by <code>Car</code> use the <code>CarModeOptions</code> parameter.</p> </li> <li> <p>If traveling by <code>Truck</code> use the <code>TruckModeOptions</code> parameter.</p> </li> </ul> <p>Default Value: <code>Car</code> </p>\"\
        },\
        \"TruckModeOptions\":{\
          \"shape\":\"CalculateRouteTruckModeOptions\",\
          \"documentation\":\"<p>Specifies route preferences when traveling by <code>Truck</code>, such as avoiding routes that use ferries or tolls, and truck specifications to consider when choosing an optimal road.</p> <p>Requirements: <code>TravelMode</code> must be specified as <code>Truck</code>.</p>\"\
        },\
        \"WaypointPositions\":{\
          \"shape\":\"CalculateRouteRequestWaypointPositionsList\",\
          \"documentation\":\"<p>Specifies an ordered list of up to 23 intermediate positions to include along a route between the departure position and destination position. </p> <ul> <li> <p>For example, from the <code>DeparturePosition</code> <code>[-123.115, 49.285]</code>, the route follows the order that the waypoint positions are given <code>[[-122.757, 49.0021],[-122.349, 47.620]]</code> </p> </li> </ul> <note> <p>If you specify a waypoint position that's not located on a road, Amazon Location <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road\\\">moves the position to the nearest road</a>. </p> <p>Specifying more than 23 waypoints returns a <code>400 ValidationException</code> error.</p> </note> <p>Valid Values: <code>[-180 to 180,-90 to 90]</code> </p>\"\
        }\
      }\
    },\
    \"CalculateRouteRequestWaypointPositionsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Position\"},\
      \"max\":23,\
      \"min\":0\
    },\
    \"CalculateRouteResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Legs\",\
        \"Summary\"\
      ],\
      \"members\":{\
        \"Legs\":{\
          \"shape\":\"LegList\",\
          \"documentation\":\"<p>Contains details about each path between a pair of positions included along a route such as: <code>StartPosition</code>, <code>EndPosition</code>, <code>Distance</code>, <code>DurationSeconds</code>, <code>Geometry</code>, and <code>Steps</code>. The number of legs returned corresponds to one fewer than the total number of positions in the request. </p> <p>For example, a route with a departure position and destination position returns one leg with the positions <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road\\\">snapped to a nearby road</a>:</p> <ul> <li> <p>The <code>StartPosition</code> is the departure position.</p> </li> <li> <p>The <code>EndPosition</code> is the destination position.</p> </li> </ul> <p>A route with a waypoint between the departure and destination position returns two legs with the positions snapped to a nearby road:</p> <ul> <li> <p>Leg 1: The <code>StartPosition</code> is the departure position . The <code>EndPosition</code> is the waypoint positon.</p> </li> <li> <p>Leg 2: The <code>StartPosition</code> is the waypoint position. The <code>EndPosition</code> is the destination position.</p> </li> </ul>\"\
        },\
        \"Summary\":{\
          \"shape\":\"CalculateRouteSummary\",\
          \"documentation\":\"<p>Contains information about the whole route, such as: <code>RouteBBox</code>, <code>DataSource</code>, <code>Distance</code>, <code>DistanceUnit</code>, and <code>DurationSeconds</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Returns the result of the route calculation. Metadata includes legs and route summary.</p>\"\
    },\
    \"CalculateRouteSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSource\",\
        \"Distance\",\
        \"DistanceUnit\",\
        \"DurationSeconds\",\
        \"RouteBBox\"\
      ],\
      \"members\":{\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The data provider of traffic and road network data used to calculate the route. Indicates one of the available providers:</p> <ul> <li> <p> <code>Esri</code> </p> </li> <li> <p> <code>Here</code> </p> </li> </ul> <p>For more information about data providers, see <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html\\\">Amazon Location Service data providers</a>.</p>\"\
        },\
        \"Distance\":{\
          \"shape\":\"CalculateRouteSummaryDistanceDouble\",\
          \"documentation\":\"<p>The total distance covered by the route. The sum of the distance travelled between every stop on the route.</p> <note> <p>The route <code>distance</code> can't be greater than 250 km. If the route exceeds 250 km, the response returns a <code>400 RoutesValidationException</code> error.</p> </note>\"\
        },\
        \"DistanceUnit\":{\
          \"shape\":\"DistanceUnit\",\
          \"documentation\":\"<p>The unit of measurement for the distance.</p>\"\
        },\
        \"DurationSeconds\":{\
          \"shape\":\"CalculateRouteSummaryDurationSecondsDouble\",\
          \"documentation\":\"<p>The total travel time for the route measured in seconds. The sum of the travel time between every stop on the route.</p>\"\
        },\
        \"RouteBBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Specifies a geographical box surrounding a route. Used to zoom into a route when displaying it in a map. For example, <code>[min x, min y, max x, max y]</code>.</p> <p>The first 2 <code>bbox</code> parameters describe the lower southwest corner: </p> <ul> <li> <p>The first <code>bbox</code> position is the X coordinate or longitude of the lower southwest corner. </p> </li> <li> <p>The second <code>bbox</code> position is the Y coordinate or latitude of the lower southwest corner. </p> </li> </ul> <p>The next 2 <code>bbox</code> parameters describe the upper northeast corner: </p> <ul> <li> <p>The third <code>bbox</code> position is the X coordinate, or longitude of the upper northeast corner. </p> </li> <li> <p>The fourth <code>bbox</code> position is the Y coordinate, or longitude of the upper northeast corner. </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>A summary of the calculated route.</p>\"\
    },\
    \"CalculateRouteSummaryDistanceDouble\":{\
      \"type\":\"double\",\
      \"box\":true,\
      \"min\":0\
    },\
    \"CalculateRouteSummaryDurationSecondsDouble\":{\
      \"type\":\"double\",\
      \"box\":true,\
      \"min\":0\
    },\
    \"CalculateRouteTruckModeOptions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AvoidFerries\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Avoids ferries when calculating routes.</p> <p>Default Value: <code>false</code> </p> <p>Valid Values: <code>false</code> | <code>true</code> </p>\"\
        },\
        \"AvoidTolls\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Avoids ferries when calculating routes.</p> <p>Default Value: <code>false</code> </p> <p>Valid Values: <code>false</code> | <code>true</code> </p>\"\
        },\
        \"Dimensions\":{\
          \"shape\":\"TruckDimensions\",\
          \"documentation\":\"<p>Specifies the truck's dimension specifications including length, height, width, and unit of measurement. Used to avoid roads that can't support the truck's dimensions.</p>\"\
        },\
        \"Weight\":{\
          \"shape\":\"TruckWeight\",\
          \"documentation\":\"<p>Specifies the truck's weight specifications including total weight and unit of measurement. Used to avoid roads that can't support the truck's weight.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains details about additional route preferences for requests that specify <code>TravelMode</code> as <code>Truck</code>.</p>\"\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>The request was unsuccessful because of a conflict.</p>\",\
      \"error\":{\
        \"httpStatusCode\":409,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"CountryCode\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[A-Z]{3}$\"\
    },\
    \"CountryCodeList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CountryCode\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"CreateGeofenceCollectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionName\",\
        \"PricingPlan\"\
      ],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>A custom name for the geofence collection.</p> <p>Requirements:</p> <ul> <li> <p>Contain only alphanumeric characters (AâZ, aâz, 0â9), hyphens (-), periods (.), and underscores (_). </p> </li> <li> <p>Must be a unique geofence collection name.</p> </li> <li> <p>No spaces allowed. For example, <code>ExampleGeofenceCollection</code>.</p> </li> </ul>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>An optional description for the geofence collection.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>A key identifier for an <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html\\\">AWS KMS customer managed key</a>. Enter a key ID, key ARN, alias name, or alias ARN. </p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>Specifies the pricing plan for the geofence collection.</p> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        },\
        \"PricingPlanDataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the data provider for the geofence collection.</p> <ul> <li> <p>Required value for the following pricing plans: <code>MobileAssetTracking </code>| <code>MobileAssetManagement</code> </p> </li> </ul> <p>For more information about <a href=\\\"https://aws.amazon.com/location/data-providers/\\\">Data Providers</a>, and <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Pricing plans</a>, see the Amazon Location Service product page.</p> <note> <p>Amazon Location Service only uses <code>PricingPlanDataSource</code> to calculate billing for your geofence collection. Your data won't be shared with the data provider, and will remain in your AWS account or Region unless you move it.</p> </note> <p>Valid Values: <code>Esri </code>| <code>Here</code> </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Applies one or more tags to the geofence collection. A tag is a key-value pair helps manage, identify, search, and filter your resources by labelling them.</p> <p>Format: <code>\\\"key\\\" : \\\"value\\\"</code> </p> <p>Restrictions:</p> <ul> <li> <p>Maximum 50 tags per resource</p> </li> <li> <p>Each resource tag must be unique with a maximum of one value.</p> </li> <li> <p>Maximum key length: 128 Unicode characters in UTF-8</p> </li> <li> <p>Maximum value length: 256 Unicode characters in UTF-8</p> </li> <li> <p>Can use alphanumeric characters (AâZ, aâz, 0â9), and the following characters: + - = . _ : / @. </p> </li> </ul>\"\
        }\
      }\
    },\
    \"CreateGeofenceCollectionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionArn\",\
        \"CollectionName\",\
        \"CreateTime\"\
      ],\
      \"members\":{\
        \"CollectionArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the geofence collection resource. Used when you need to specify a resource across all AWS. </p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection</code> </p> </li> </ul>\"\
        },\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name for the geofence collection.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence collection was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      }\
    },\
    \"CreateMapRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Configuration\",\
        \"MapName\",\
        \"PricingPlan\"\
      ],\
      \"members\":{\
        \"Configuration\":{\
          \"shape\":\"MapConfiguration\",\
          \"documentation\":\"<p>Specifies the map style selected from an available data provider.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>An optional description for the map resource.</p>\"\
        },\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name for the map resource.</p> <p>Requirements:</p> <ul> <li> <p>Must contain only alphanumeric characters (AâZ, aâz, 0â9), hyphens (-), periods (.), and underscores (_). </p> </li> <li> <p>Must be a unique map resource name. </p> </li> <li> <p>No spaces allowed. For example, <code>ExampleMap</code>.</p> </li> </ul>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>Specifies the pricing plan for your map resource.</p> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Applies one or more tags to the map resource. A tag is a key-value pair helps manage, identify, search, and filter your resources by labelling them.</p> <p>Format: <code>\\\"key\\\" : \\\"value\\\"</code> </p> <p>Restrictions:</p> <ul> <li> <p>Maximum 50 tags per resource</p> </li> <li> <p>Each resource tag must be unique with a maximum of one value.</p> </li> <li> <p>Maximum key length: 128 Unicode characters in UTF-8</p> </li> <li> <p>Maximum value length: 256 Unicode characters in UTF-8</p> </li> <li> <p>Can use alphanumeric characters (AâZ, aâz, 0â9), and the following characters: + - = . _ : / @. </p> </li> </ul>\"\
        }\
      }\
    },\
    \"CreateMapResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"MapArn\",\
        \"MapName\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the map resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>\"\
        },\
        \"MapArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the map resource. Used to specify a resource across all AWS.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:maps/ExampleMap</code> </p> </li> </ul>\"\
        },\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the map resource.</p>\"\
        }\
      }\
    },\
    \"CreatePlaceIndexRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSource\",\
        \"IndexName\",\
        \"PricingPlan\"\
      ],\
      \"members\":{\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the data provider of geospatial data.</p> <note> <p>This field is case-sensitive. Enter the valid values as shown. For example, entering <code>HERE</code> returns an error.</p> </note> <p>Valid values include:</p> <ul> <li> <p> <code>Esri</code> â For additional information about <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/esri.html\\\">Esri</a>'s coverage in your region of interest, see <a href=\\\"https://developers.arcgis.com/rest/geocode/api-reference/geocode-coverage.htm\\\">Esri details on geocoding coverage</a>.</p> </li> <li> <p> <code>Here</code> â For additional information about <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/HERE.html\\\">HERE Technologies</a>'s coverage in your region of interest, see <a href=\\\"https://developer.here.com/documentation/geocoder/dev_guide/topics/coverage-geocoder.html\\\">HERE details on goecoding coverage</a>.</p> <important> <p>Place index resources using HERE Technologies as a data provider can't <a href=\\\"https://docs.aws.amazon.com/location-places/latest/APIReference/API_DataSourceConfiguration.html\\\">store results</a> for locations in Japan. For more information, see the <a href=\\\"https://aws.amazon.com/service-terms/\\\">AWS Service Terms</a> for Amazon Location Service.</p> </important> </li> </ul> <p>For additional information , see <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html\\\">Data providers</a> on the <i>Amazon Location Service Developer Guide</i>.</p>\"\
        },\
        \"DataSourceConfiguration\":{\
          \"shape\":\"DataSourceConfiguration\",\
          \"documentation\":\"<p>Specifies the data storage option requesting Places.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description for the place index resource.</p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the place index resource. </p> <p>Requirements:</p> <ul> <li> <p>Contain only alphanumeric characters (AâZ, aâz, 0â9), hyphens (-), periods (.), and underscores (_).</p> </li> <li> <p>Must be a unique place index resource name.</p> </li> <li> <p>No spaces allowed. For example, <code>ExamplePlaceIndex</code>.</p> </li> </ul>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>Specifies the pricing plan for your place index resource.</p> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Applies one or more tags to the place index resource. A tag is a key-value pair helps manage, identify, search, and filter your resources by labelling them.</p> <p>Format: <code>\\\"key\\\" : \\\"value\\\"</code> </p> <p>Restrictions:</p> <ul> <li> <p>Maximum 50 tags per resource</p> </li> <li> <p>Each resource tag must be unique with a maximum of one value.</p> </li> <li> <p>Maximum key length: 128 Unicode characters in UTF-8</p> </li> <li> <p>Maximum value length: 256 Unicode characters in UTF-8</p> </li> <li> <p>Can use alphanumeric characters (AâZ, aâz, 0â9), and the following characters: + - = . _ : / @. </p> </li> </ul>\"\
        }\
      }\
    },\
    \"CreatePlaceIndexResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"IndexArn\",\
        \"IndexName\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the place index resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"IndexArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the place index resource. Used to specify a resource across AWS. </p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:place-index/ExamplePlaceIndex</code> </p> </li> </ul>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name for the place index resource.</p>\"\
        }\
      }\
    },\
    \"CreateRouteCalculatorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CalculatorName\",\
        \"DataSource\",\
        \"PricingPlan\"\
      ],\
      \"members\":{\
        \"CalculatorName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the route calculator resource. </p> <p>Requirements:</p> <ul> <li> <p>Can use alphanumeric characters (AâZ, aâz, 0â9) , hyphens (-), periods (.), and underscores (_).</p> </li> <li> <p>Must be a unique Route calculator resource name.</p> </li> <li> <p>No spaces allowed. For example, <code>ExampleRouteCalculator</code>.</p> </li> </ul>\"\
        },\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the data provider of traffic and road network data.</p> <note> <p>This field is case-sensitive. Enter the valid values as shown. For example, entering <code>HERE</code> returns an error.</p> </note> <p>Valid values include:</p> <ul> <li> <p> <code>Esri</code> â For additional information about <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/esri.html\\\">Esri</a>'s coverage in your region of interest, see <a href=\\\"https://doc.arcgis.com/en/arcgis-online/reference/network-coverage.htm\\\">Esri details on street networks and traffic coverage</a>.</p> </li> <li> <p> <code>Here</code> â For additional information about <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/HERE.html\\\">HERE Technologies</a>'s coverage in your region of interest, see <a href=\\\"https://developer.here.com/documentation/routing-api/dev_guide/topics/coverage/car-routing.html\\\">HERE car routing coverage</a> and <a href=\\\"https://developer.here.com/documentation/routing-api/dev_guide/topics/coverage/truck-routing.html\\\">HERE truck routing coverage</a>.</p> </li> </ul> <p>For additional information , see <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html\\\">Data providers</a> on the <i>Amazon Location Service Developer Guide</i>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description for the route calculator resource.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>Specifies the pricing plan for your route calculator resource.</p> <p>For additional details and restrictions on each pricing plan option, see <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Applies one or more tags to the route calculator resource. A tag is a key-value pair helps manage, identify, search, and filter your resources by labelling them.</p> <ul> <li> <p>For example: { <code>\\\"tag1\\\" : \\\"value1\\\"</code>, <code>\\\"tag2\\\" : \\\"value2\\\"</code>}</p> </li> </ul> <p>Format: <code>\\\"key\\\" : \\\"value\\\"</code> </p> <p>Restrictions:</p> <ul> <li> <p>Maximum 50 tags per resource</p> </li> <li> <p>Each resource tag must be unique with a maximum of one value.</p> </li> <li> <p>Maximum key length: 128 Unicode characters in UTF-8</p> </li> <li> <p>Maximum value length: 256 Unicode characters in UTF-8</p> </li> <li> <p>Can use alphanumeric characters (AâZ, aâz, 0â9), and the following characters: + - = . _ : / @. </p> </li> </ul>\"\
        }\
      }\
    },\
    \"CreateRouteCalculatorResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CalculatorArn\",\
        \"CalculatorName\",\
        \"CreateTime\"\
      ],\
      \"members\":{\
        \"CalculatorArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the route calculator resource. Use the ARN when you specify a resource across all AWS.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:route-calculator/ExampleCalculator</code> </p> </li> </ul>\"\
        },\
        \"CalculatorName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the route calculator resource. </p> <ul> <li> <p>For example, <code>ExampleRouteCalculator</code>.</p> </li> </ul>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp when the route calculator resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p> <ul> <li> <p>For example, <code>2020â07-2T12:15:20.000Z+01:00</code> </p> </li> </ul>\"\
        }\
      }\
    },\
    \"CreateTrackerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"PricingPlan\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>An optional description for the tracker resource.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>A key identifier for an <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html\\\">AWS KMS customer managed key</a>. Enter a key ID, key ARN, alias name, or alias ARN.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>Specifies the pricing plan for the tracker resource.</p> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        },\
        \"PricingPlanDataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the data provider for the tracker resource.</p> <ul> <li> <p>Required value for the following pricing plans: <code>MobileAssetTracking </code>| <code>MobileAssetManagement</code> </p> </li> </ul> <p>For more information about <a href=\\\"https://aws.amazon.com/location/data-providers/\\\">Data Providers</a>, and <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Pricing plans</a>, see the Amazon Location Service product page.</p> <note> <p>Amazon Location Service only uses <code>PricingPlanDataSource</code> to calculate billing for your tracker resource. Your data will not be shared with the data provider, and will remain in your AWS account or Region unless you move it.</p> </note> <p>Valid Values: <code>Esri</code> | <code>Here</code> </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Applies one or more tags to the tracker resource. A tag is a key-value pair helps manage, identify, search, and filter your resources by labelling them.</p> <p>Format: <code>\\\"key\\\" : \\\"value\\\"</code> </p> <p>Restrictions:</p> <ul> <li> <p>Maximum 50 tags per resource</p> </li> <li> <p>Each resource tag must be unique with a maximum of one value.</p> </li> <li> <p>Maximum key length: 128 Unicode characters in UTF-8</p> </li> <li> <p>Maximum value length: 256 Unicode characters in UTF-8</p> </li> <li> <p>Can use alphanumeric characters (AâZ, aâz, 0â9), and the following characters: + - = . _ : / @. </p> </li> </ul>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name for the tracker resource.</p> <p>Requirements:</p> <ul> <li> <p>Contain only alphanumeric characters (A-Z, a-z, 0-9) , hyphens (-), periods (.), and underscores (_).</p> </li> <li> <p>Must be a unique tracker resource name.</p> </li> <li> <p>No spaces allowed. For example, <code>ExampleTracker</code>.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"CreateTrackerResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"TrackerArn\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the tracker resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"TrackerArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the tracker resource. Used when you need to specify a resource across all AWS.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:tracker/ExampleTracker</code> </p> </li> </ul>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource.</p>\"\
        }\
      }\
    },\
    \"DataSourceConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"IntendedUse\":{\
          \"shape\":\"IntendedUse\",\
          \"documentation\":\"<p>Specifies how the results of an operation will be stored by the caller. </p> <p>Valid values include:</p> <ul> <li> <p> <code>SingleUse</code> specifies that the results won't be stored. </p> </li> <li> <p> <code>Storage</code> specifies that the result can be cached or stored in a database.</p> </li> </ul> <p>Default value: <code>SingleUse</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the data storage option chosen for requesting Places.</p> <important> <p>When using Amazon Location Places:</p> <ul> <li> <p>If using HERE Technologies as a data provider, you can't store results for locations in Japan by setting <code>IntendedUse</code> to <code>Storage</code>. parameter.</p> </li> <li> <p>Under the <code>MobileAssetTracking</code> or <code>MobilAssetManagement</code> pricing plan, you can't store results from your place index resources by setting <code>IntendedUse</code> to <code>Storage</code>. This returns a validation exception error.</p> </li> </ul> <p>For more information, see the <a href=\\\"https://aws.amazon.com/service-terms/\\\">AWS Service Terms</a> for Amazon Location Service.</p> </important>\"\
    },\
    \"DeleteGeofenceCollectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionName\"],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the geofence collection to be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        }\
      }\
    },\
    \"DeleteGeofenceCollectionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteMapRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MapName\"],\
      \"members\":{\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the map resource to be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MapName\"\
        }\
      }\
    },\
    \"DeleteMapResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeletePlaceIndexRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"IndexName\"],\
      \"members\":{\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the place index resource to be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IndexName\"\
        }\
      }\
    },\
    \"DeletePlaceIndexResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteRouteCalculatorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CalculatorName\"],\
      \"members\":{\
        \"CalculatorName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the route calculator resource to be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CalculatorName\"\
        }\
      }\
    },\
    \"DeleteRouteCalculatorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteTrackerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrackerName\"],\
      \"members\":{\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource to be deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"DeleteTrackerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeGeofenceCollectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionName\"],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the geofence collection.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        }\
      }\
    },\
    \"DescribeGeofenceCollectionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionArn\",\
        \"CollectionName\",\
        \"CreateTime\",\
        \"Description\",\
        \"PricingPlan\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CollectionArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the geofence collection resource. Used when you need to specify a resource across all AWS. </p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection</code> </p> </li> </ul>\"\
        },\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the geofence collection.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description for the geofence collection.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>A key identifier for an <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html\\\">AWS KMS customer managed key</a> assigned to the Amazon Location resource</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>The pricing plan selected for the specified geofence collection.</p> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        },\
        \"PricingPlanDataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The specified data provider for the geofence collection.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Displays the key, value pairs of tags associated with this resource.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence collection was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      }\
    },\
    \"DescribeMapRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MapName\"],\
      \"members\":{\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the map resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MapName\"\
        }\
      }\
    },\
    \"DescribeMapResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Configuration\",\
        \"CreateTime\",\
        \"DataSource\",\
        \"Description\",\
        \"MapArn\",\
        \"MapName\",\
        \"PricingPlan\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"Configuration\":{\
          \"shape\":\"MapConfiguration\",\
          \"documentation\":\"<p>Specifies the map tile style selected from a partner data provider.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the map resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>\"\
        },\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the data provider for the associated map tiles.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description for the map resource.</p>\"\
        },\
        \"MapArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the map resource. Used to specify a resource across all AWS.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:maps/ExampleMap</code> </p> </li> </ul>\"\
        },\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The map style selected from an available provider.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>The pricing plan selected for the specified map resource.</p> <pre><code> &lt;p&gt;For additional details and restrictions on each pricing plan option, see the &lt;a href=&quot;https://aws.amazon.com/location/pricing/&quot;&gt;Amazon Location Service pricing page&lt;/a&gt;.&lt;/p&gt; </code></pre>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Tags associated with the map resource.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the map resource was last update in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>\"\
        }\
      }\
    },\
    \"DescribePlaceIndexRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"IndexName\"],\
      \"members\":{\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the place index resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IndexName\"\
        }\
      }\
    },\
    \"DescribePlaceIndexResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"DataSource\",\
        \"DataSourceConfiguration\",\
        \"Description\",\
        \"IndexArn\",\
        \"IndexName\",\
        \"PricingPlan\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the place index resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The data provider of geospatial data. Indicates one of the available providers:</p> <ul> <li> <p> <code>Esri</code> </p> </li> <li> <p> <code>Here</code> </p> </li> </ul> <p>For additional details on data providers, see the <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html\\\">Amazon Location Service data providers page</a>.</p>\"\
        },\
        \"DataSourceConfiguration\":{\
          \"shape\":\"DataSourceConfiguration\",\
          \"documentation\":\"<p>The specified data storage option for requesting Places.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description for the place index resource.</p>\"\
        },\
        \"IndexArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the place index resource. Used to specify a resource across AWS. </p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:place-index/ExamplePlaceIndex</code> </p> </li> </ul>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the place index resource being described.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>The pricing plan selected for the specified place index resource.</p> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Tags associated with place index resource.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the place index resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      }\
    },\
    \"DescribeRouteCalculatorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CalculatorName\"],\
      \"members\":{\
        \"CalculatorName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the route calculator resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CalculatorName\"\
        }\
      }\
    },\
    \"DescribeRouteCalculatorResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CalculatorArn\",\
        \"CalculatorName\",\
        \"CreateTime\",\
        \"DataSource\",\
        \"Description\",\
        \"PricingPlan\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CalculatorArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the Route calculator resource. Use the ARN when you specify a resource across AWS.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:route-calculator/ExampleCalculator</code> </p> </li> </ul>\"\
        },\
        \"CalculatorName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the route calculator resource being described.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp when the route calculator resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p> <ul> <li> <p>For example, <code>2020â07-2T12:15:20.000Z+01:00</code> </p> </li> </ul>\"\
        },\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The data provider of traffic and road network data. Indicates one of the available providers:</p> <ul> <li> <p> <code>Esri</code> </p> </li> <li> <p> <code>Here</code> </p> </li> </ul> <p>For more information about data providers, see <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html\\\">Amazon Location Service data providers</a>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description of the route calculator resource.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>The pricing plan selected for the specified route calculator resource.</p> <p>For additional details and restrictions on each pricing plan option, see <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing</a>.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Tags associated with route calculator resource.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp when the route calculator resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p> <ul> <li> <p>For example, <code>2020â07-2T12:15:20.000Z+01:00</code> </p> </li> </ul>\"\
        }\
      }\
    },\
    \"DescribeTrackerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrackerName\"],\
      \"members\":{\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"DescribeTrackerResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"Description\",\
        \"PricingPlan\",\
        \"TrackerArn\",\
        \"TrackerName\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the tracker resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description for the tracker resource.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>A key identifier for an <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/create-keys.html\\\">AWS KMS customer managed key</a> assigned to the Amazon Location resource.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>The pricing plan selected for the specified tracker resource.</p> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        },\
        \"PricingPlanDataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The specified data provider for the tracker resource.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>The tags associated with the tracker resource.</p>\"\
        },\
        \"TrackerArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the tracker resource. Used when you need to specify a resource across all AWS.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:tracker/ExampleTracker</code> </p> </li> </ul>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the tracker resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      }\
    },\
    \"DevicePosition\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Position\",\
        \"ReceivedTime\",\
        \"SampleTime\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The device whose position you retrieved.</p>\"\
        },\
        \"Position\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The last known device position.</p>\"\
        },\
        \"ReceivedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the tracker resource received the device position in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"SampleTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp at which the device's position was determined. Uses <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the device position details.</p>\"\
    },\
    \"DevicePositionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DevicePosition\"}\
    },\
    \"DevicePositionUpdate\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceId\",\
        \"Position\",\
        \"SampleTime\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The device associated to the position update.</p>\"\
        },\
        \"Position\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The latest device position defined in <a href=\\\"https://earth-info.nga.mil/GandG/wgs84/index.html\\\">WGS 84</a> format: <code>[X or longitude, Y or latitude]</code>.</p>\"\
        },\
        \"SampleTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp at which the device's position was determined. Uses <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the position update details for a device.</p>\"\
    },\
    \"DimensionUnit\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Meters\",\
        \"Feet\"\
      ]\
    },\
    \"DisassociateTrackerConsumerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ConsumerArn\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"ConsumerArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) for the geofence collection to be disassociated from the tracker resource. Used when you need to specify a resource across all AWS. </p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollectionConsumer</code> </p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ConsumerArn\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource to be dissociated from the consumer.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"DisassociateTrackerConsumerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DistanceUnit\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Kilometers\",\
        \"Miles\"\
      ]\
    },\
    \"Double\":{\
      \"type\":\"double\",\
      \"box\":true\
    },\
    \"GeofenceGeometry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Polygon\":{\
          \"shape\":\"LinearRings\",\
          \"documentation\":\"<p>An array of 1 or more linear rings. A linear ring is an array of 4 or more vertices, where the first and last vertex are the same to form a closed boundary. Each vertex is a 2-dimensional point of the form: <code>[longitude, latitude]</code>. </p> <p>The first linear ring is an outer ring, describing the polygon's boundary. Subsequent linear rings may be inner or outer rings to describe holes and islands. Outer rings must list their vertices in counter-clockwise order around the ring's center, where the left side is the polygon's exterior. Inner rings must list their vertices in clockwise order, where the left side is the polygon's interior.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the geofence geometry details.</p> <note> <p>Amazon Location doesn't currently support polygons with holes, multipolygons, polygons that are wound clockwise, or that cross the antimeridian. </p> </note>\"\
    },\
    \"GetDevicePositionHistoryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceId\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The device whose position history you want to retrieve.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DeviceId\"\
        },\
        \"EndTimeExclusive\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specify the end time for the position history in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. By default, the value will be the time that the request is made.</p> <p>Requirement:</p> <ul> <li> <p>The time specified for <code>EndTimeExclusive</code> must be after the time for <code>StartTimeInclusive</code>.</p> </li> </ul>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p> <p>Default value: <code>null</code> </p>\"\
        },\
        \"StartTimeInclusive\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specify the start time for the position history in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. By default, the value will be 24 hours prior to the time that the request is made.</p> <p>Requirement:</p> <ul> <li> <p>The time specified for <code>StartTimeInclusive</code> must be before <code>EndTimeExclusive</code>.</p> </li> </ul>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The tracker resource receiving the request for the device position history.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"GetDevicePositionHistoryResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"DevicePositions\"],\
      \"members\":{\
        \"DevicePositions\":{\
          \"shape\":\"DevicePositionList\",\
          \"documentation\":\"<p>Contains the position history details for the requested device.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results.</p>\"\
        }\
      }\
    },\
    \"GetDevicePositionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceId\",\
        \"TrackerName\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The device whose position you want to retrieve.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"DeviceId\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The tracker resource receiving the position update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"GetDevicePositionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Position\",\
        \"ReceivedTime\",\
        \"SampleTime\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The device whose position you retrieved.</p>\"\
        },\
        \"Position\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The last known device position.</p>\"\
        },\
        \"ReceivedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the tracker resource received the device position in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601 </a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"SampleTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp at which the device's position was determined. Uses <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601 </a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      }\
    },\
    \"GetGeofenceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionName\",\
        \"GeofenceId\"\
      ],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The geofence collection storing the target geofence.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The geofence you're retrieving details for.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"GeofenceId\"\
        }\
      }\
    },\
    \"GetGeofenceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"GeofenceId\",\
        \"Geometry\",\
        \"Status\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence collection was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The geofence identifier.</p>\"\
        },\
        \"Geometry\":{\
          \"shape\":\"GeofenceGeometry\",\
          \"documentation\":\"<p>Contains the geofence geometry details describing a polygon.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the state of the geofence. A geofence will hold one of the following states:</p> <ul> <li> <p> <code>ACTIVE</code> â The geofence has been indexed by the system. </p> </li> <li> <p> <code>PENDING</code> â The geofence is being processed by the system.</p> </li> <li> <p> <code>FAILED</code> â The geofence failed to be indexed by the system.</p> </li> <li> <p> <code>DELETED</code> â The geofence has been deleted from the system index.</p> </li> <li> <p> <code>DELETING</code> â The geofence is being deleted from the system index.</p> </li> </ul>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence collection was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      }\
    },\
    \"GetMapGlyphsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FontStack\",\
        \"FontUnicodeRange\",\
        \"MapName\"\
      ],\
      \"members\":{\
        \"FontStack\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A comma-separated list of fonts to load glyphs from in order of preference. For example, <code>Noto Sans Regular, Arial Unicode</code>.</p> <p>Valid fonts for <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/esri.html\\\">Esri</a> styles: </p> <ul> <li> <p>VectorEsriDarkGrayCanvas â <code>Ubuntu Medium Italic</code> | <code>Ubuntu Medium</code> | <code>Ubuntu Italic</code> | <code>Ubuntu Regular</code> | <code>Ubuntu Bold</code> </p> </li> <li> <p>VectorEsriLightGrayCanvas â <code>Ubuntu Italic</code> | <code>Ubuntu Regular</code> | <code>Ubuntu Light</code> | <code>Ubuntu Bold</code> </p> </li> <li> <p>VectorEsriTopographic â <code>Noto Sans Italic</code> | <code>Noto Sans Regular</code> | <code>Noto Sans Bold</code> | <code>Noto Serif Regular</code> | <code>Roboto Condensed Light Italic</code> </p> </li> <li> <p>VectorEsriStreets â <code>Arial Regular</code> | <code>Arial Italic</code> | <code>Arial Bold</code> </p> </li> <li> <p>VectorEsriNavigation â <code>Arial Regular</code> | <code>Arial Italic</code> | <code>Arial Bold</code> </p> </li> </ul> <p>Valid fonts for <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/HERE.html\\\">HERE Technologies</a> styles: </p> <ul> <li> <p> <code>VectorHereBerlin</code> â <code>Fira GO Regular</code> | <code>Fira GO Bold</code> </p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FontStack\"\
        },\
        \"FontUnicodeRange\":{\
          \"shape\":\"GetMapGlyphsRequestFontUnicodeRangeString\",\
          \"documentation\":\"<p>A Unicode range of characters to download glyphs for. Each response will contain 256 characters. For example, 0â255 includes all characters from range <code>U+0000</code> to <code>00FF</code>. Must be aligned to multiples of 256.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FontUnicodeRange\"\
        },\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The map resource associated with the glyph ï¬le.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MapName\"\
        }\
      }\
    },\
    \"GetMapGlyphsRequestFontUnicodeRangeString\":{\
      \"type\":\"string\",\
      \"pattern\":\"^[0-9]+-[0-9]+\\\\.pbf$\"\
    },\
    \"GetMapGlyphsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Blob\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>The blob's content type.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The map glyph content type. For example, <code>application/octet-stream</code>.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        }\
      },\
      \"payload\":\"Blob\"\
    },\
    \"GetMapSpritesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FileName\",\
        \"MapName\"\
      ],\
      \"members\":{\
        \"FileName\":{\
          \"shape\":\"GetMapSpritesRequestFileNameString\",\
          \"documentation\":\"<p>The name of the sprite ï¬le. Use the following ï¬le names for the sprite sheet:</p> <ul> <li> <p> <code>sprites.png</code> </p> </li> <li> <p> <code>sprites@2x.png</code> for high pixel density displays</p> </li> </ul> <p>For the JSON document contain image offsets. Use the following ï¬le names:</p> <ul> <li> <p> <code>sprites.json</code> </p> </li> <li> <p> <code>sprites@2x.json</code> for high pixel density displays</p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FileName\"\
        },\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The map resource associated with the sprite ï¬le.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MapName\"\
        }\
      }\
    },\
    \"GetMapSpritesRequestFileNameString\":{\
      \"type\":\"string\",\
      \"pattern\":\"^sprites(@2x)?\\\\.(png|json)$\"\
    },\
    \"GetMapSpritesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Blob\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>Contains the body of the sprite sheet or JSON offset ï¬le.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The content type of the sprite sheet and offsets. For example, the sprite sheet content type is <code>image/png</code>, and the sprite offset JSON document is <code>application/json</code>. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        }\
      },\
      \"payload\":\"Blob\"\
    },\
    \"GetMapStyleDescriptorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MapName\"],\
      \"members\":{\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The map resource to retrieve the style descriptor from.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MapName\"\
        }\
      }\
    },\
    \"GetMapStyleDescriptorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Blob\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>Contains the body of the style descriptor.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The style descriptor's content type. For example, <code>application/json</code>.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        }\
      },\
      \"payload\":\"Blob\"\
    },\
    \"GetMapTileRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MapName\",\
        \"X\",\
        \"Y\",\
        \"Z\"\
      ],\
      \"members\":{\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The map resource to retrieve the map tiles from.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MapName\"\
        },\
        \"X\":{\
          \"shape\":\"GetMapTileRequestXString\",\
          \"documentation\":\"<p>The X axis value for the map tile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"X\"\
        },\
        \"Y\":{\
          \"shape\":\"GetMapTileRequestYString\",\
          \"documentation\":\"<p>The Y axis value for the map tile. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Y\"\
        },\
        \"Z\":{\
          \"shape\":\"GetMapTileRequestZString\",\
          \"documentation\":\"<p>The zoom value for the map tile.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Z\"\
        }\
      }\
    },\
    \"GetMapTileRequestXString\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\d+\"\
    },\
    \"GetMapTileRequestYString\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\d+\"\
    },\
    \"GetMapTileRequestZString\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\d+\"\
    },\
    \"GetMapTileResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Blob\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>Contains Mapbox Vector Tile (MVT) data.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The map tile's content type. For example, <code>application/vnd.mapbox-vector-tile</code>.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        }\
      },\
      \"payload\":\"Blob\"\
    },\
    \"Id\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"^[-._\\\\p{L}\\\\p{N}]+$\"\
    },\
    \"IntendedUse\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SingleUse\",\
        \"Storage\"\
      ]\
    },\
    \"InternalServerException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>The request has failed to process because of an unknown server error, exception, or failure.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true,\
      \"retryable\":{\"throttling\":false}\
    },\
    \"KmsKeyId\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1\
    },\
    \"Leg\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Distance\",\
        \"DurationSeconds\",\
        \"EndPosition\",\
        \"StartPosition\",\
        \"Steps\"\
      ],\
      \"members\":{\
        \"Distance\":{\
          \"shape\":\"LegDistanceDouble\",\
          \"documentation\":\"<p>The distance between the leg's <code>StartPosition</code> and <code>EndPosition</code> along a calculated route. </p> <ul> <li> <p>The default measurement is <code>Kilometers</code> unless the request specifies a <code>DistanceUnit</code> of <code>Miles</code>.</p> </li> </ul>\"\
        },\
        \"DurationSeconds\":{\
          \"shape\":\"LegDurationSecondsDouble\",\
          \"documentation\":\"<p>The estimated travel time between the leg's <code>StartPosition</code> and <code>EndPosition</code>. The travel mode and departure time that you specify in the request determines the calculated time.</p>\"\
        },\
        \"EndPosition\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The terminating position of the leg. Follows the format <code>[longitude,latitude]</code>.</p> <note> <p>If the <code>EndPosition</code> isn't located on a road, it's <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road\\\">snapped to a nearby road</a>. </p> </note>\"\
        },\
        \"Geometry\":{\
          \"shape\":\"LegGeometry\",\
          \"documentation\":\"<p>Contains the calculated route's path as a linestring geometry.</p>\"\
        },\
        \"StartPosition\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The starting position of the leg. Follows the format <code>[longitude,latitude]</code>.</p> <note> <p>If the <code>StartPosition</code> isn't located on a road, it's <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road\\\">snapped to a nearby road</a>. </p> </note>\"\
        },\
        \"Steps\":{\
          \"shape\":\"StepList\",\
          \"documentation\":\"<p>Contains a list of steps, which represent subsections of a leg. Each step provides instructions for how to move to the next step in the leg such as the step's start position, end position, travel distance, travel duration, and geometry offset.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the calculated route's details for each path between a pair of positions. The number of legs returned corresponds to one fewer than the total number of positions in the request. </p> <p>For example, a route with a departure position and destination position returns one leg with the positions <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/calculate-route.html#snap-to-nearby-road\\\">snapped to a nearby road</a>:</p> <ul> <li> <p>The <code>StartPosition</code> is the departure position.</p> </li> <li> <p>The <code>EndPosition</code> is the destination position.</p> </li> </ul> <p>A route with a waypoint between the departure and destination position returns two legs with the positions snapped to a nearby road:</p> <ul> <li> <p>Leg 1: The <code>StartPosition</code> is the departure position . The <code>EndPosition</code> is the waypoint positon.</p> </li> <li> <p>Leg 2: The <code>StartPosition</code> is the waypoint position. The <code>EndPosition</code> is the destination position.</p> </li> </ul>\"\
    },\
    \"LegDistanceDouble\":{\
      \"type\":\"double\",\
      \"box\":true,\
      \"min\":0\
    },\
    \"LegDurationSecondsDouble\":{\
      \"type\":\"double\",\
      \"box\":true,\
      \"min\":0\
    },\
    \"LegGeometry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LineString\":{\
          \"shape\":\"LineString\",\
          \"documentation\":\"<p>An ordered list of positions used to plot a route on a map. </p> <p>The first position is closest to the start position for the leg, and the last position is the closest to the end position for the leg.</p> <ul> <li> <p>For example, <code>[[-123.117, 49.284],[-123.115, 49.285],[-123.115, 49.285]]</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the geometry details for each path between a pair of positions. Used in plotting a route leg on a map.</p>\"\
    },\
    \"LegList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Leg\"}\
    },\
    \"LineString\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Position\"},\
      \"min\":2\
    },\
    \"LinearRing\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Position\"},\
      \"min\":4\
    },\
    \"LinearRings\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LinearRing\"},\
      \"min\":1\
    },\
    \"ListDevicePositionsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrackerName\"],\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListDevicePositionsRequestMaxResultsInteger\",\
          \"documentation\":\"<p>An optional limit for the number of entries returned in a single call.</p> <p>Default value: <code>100</code> </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page.</p> <p>Default value: <code>null</code> </p>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The tracker resource containing the requested devices.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"ListDevicePositionsRequestMaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListDevicePositionsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Entries\"],\
      \"members\":{\
        \"Entries\":{\
          \"shape\":\"ListDevicePositionsResponseEntryList\",\
          \"documentation\":\"<p>Contains details about each device's last known position. These details includes the device ID, the time when the position was sampled on the device, the time that the service received the update, and the most recent coordinates.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListDevicePositionsResponseEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DeviceId\",\
        \"Position\",\
        \"SampleTime\"\
      ],\
      \"members\":{\
        \"DeviceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The ID of the device for this position.</p>\"\
        },\
        \"Position\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The last known device position. Empty if no positions currently stored.</p>\"\
        },\
        \"SampleTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp at which the device position was determined. Uses <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the tracker resource details.</p>\"\
    },\
    \"ListDevicePositionsResponseEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListDevicePositionsResponseEntry\"}\
    },\
    \"ListGeofenceCollectionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListGeofenceCollectionsRequestMaxResultsInteger\",\
          \"documentation\":\"<p>An optional limit for the number of resources returned in a single call. </p> <p>Default value: <code>100</code> </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p> <p>Default value: <code>null</code> </p>\"\
        }\
      }\
    },\
    \"ListGeofenceCollectionsRequestMaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListGeofenceCollectionsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Entries\"],\
      \"members\":{\
        \"Entries\":{\
          \"shape\":\"ListGeofenceCollectionsResponseEntryList\",\
          \"documentation\":\"<p>Lists the geofence collections that exist in your AWS account.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>\"\
        }\
      }\
    },\
    \"ListGeofenceCollectionsResponseEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionName\",\
        \"CreateTime\",\
        \"Description\",\
        \"PricingPlan\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the geofence collection.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence collection was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The description for the geofence collection</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>The pricing plan for the specified geofence collection.</p> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        },\
        \"PricingPlanDataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The specified data provider for the geofence collection.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specifies a timestamp for when the resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the geofence collection details.</p>\"\
    },\
    \"ListGeofenceCollectionsResponseEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListGeofenceCollectionsResponseEntry\"}\
    },\
    \"ListGeofenceResponseEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"GeofenceId\",\
        \"Geometry\",\
        \"Status\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence was stored in a geofence collection in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The geofence identifier.</p>\"\
        },\
        \"Geometry\":{\
          \"shape\":\"GeofenceGeometry\",\
          \"documentation\":\"<p>Contains the geofence geometry details describing a polygon.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the state of the geofence. A geofence will hold one of the following states:</p> <ul> <li> <p> <code>ACTIVE</code> â The geofence has been indexed by the system. </p> </li> <li> <p> <code>PENDING</code> â The geofence is being processed by the system.</p> </li> <li> <p> <code>FAILED</code> â The geofence failed to be indexed by the system.</p> </li> <li> <p> <code>DELETED</code> â The geofence has been deleted from the system index.</p> </li> <li> <p> <code>DELETING</code> â The geofence is being deleted from the system index.</p> </li> </ul>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains a list of geofences stored in a given geofence collection.</p>\"\
    },\
    \"ListGeofenceResponseEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListGeofenceResponseEntry\"}\
    },\
    \"ListGeofencesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionName\"],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the geofence collection storing the list of geofences.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p> <p>Default value: <code>null</code> </p>\"\
        }\
      }\
    },\
    \"ListGeofencesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Entries\"],\
      \"members\":{\
        \"Entries\":{\
          \"shape\":\"ListGeofenceResponseEntryList\",\
          \"documentation\":\"<p>Contains a list of geofences stored in the geofence collection.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>\"\
        }\
      }\
    },\
    \"ListMapsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListMapsRequestMaxResultsInteger\",\
          \"documentation\":\"<p>An optional limit for the number of resources returned in a single call. </p> <p>Default value: <code>100</code> </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page.</p> <p>Default value: <code>null</code> </p>\"\
        }\
      }\
    },\
    \"ListMapsRequestMaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListMapsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Entries\"],\
      \"members\":{\
        \"Entries\":{\
          \"shape\":\"ListMapsResponseEntryList\",\
          \"documentation\":\"<p>Contains a list of maps in your AWS account</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>\"\
        }\
      }\
    },\
    \"ListMapsResponseEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"DataSource\",\
        \"Description\",\
        \"MapName\",\
        \"PricingPlan\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the map resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>\"\
        },\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Specifies the data provider for the associated map tiles.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The description for the map resource.</p>\"\
        },\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the associated map resource.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>The pricing plan for the specified map resource.</p> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the map resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains details of an existing map resource in your AWS account.</p>\"\
    },\
    \"ListMapsResponseEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListMapsResponseEntry\"}\
    },\
    \"ListPlaceIndexesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListPlaceIndexesRequestMaxResultsInteger\",\
          \"documentation\":\"<p>An optional limit for the maximum number of results returned in a single call.</p> <p>Default value: <code>100</code> </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page.</p> <p>Default value: <code>null</code> </p>\"\
        }\
      }\
    },\
    \"ListPlaceIndexesRequestMaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListPlaceIndexesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Entries\"],\
      \"members\":{\
        \"Entries\":{\
          \"shape\":\"ListPlaceIndexesResponseEntryList\",\
          \"documentation\":\"<p>Lists the place index resources that exist in your AWS account</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListPlaceIndexesResponseEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"DataSource\",\
        \"Description\",\
        \"IndexName\",\
        \"PricingPlan\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the place index resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The data provider of geospatial data. Indicates one of the available providers:</p> <ul> <li> <p> <code>Esri</code> </p> </li> <li> <p> <code>Here</code> </p> </li> </ul> <p>For additional details on data providers, see the <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html\\\">Amazon Location Service data providers page</a>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description for the place index resource.</p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the place index resource.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>The pricing plan for the specified place index resource.</p> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the place index resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A place index resource listed in your AWS account.</p>\"\
    },\
    \"ListPlaceIndexesResponseEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListPlaceIndexesResponseEntry\"}\
    },\
    \"ListRouteCalculatorsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListRouteCalculatorsRequestMaxResultsInteger\",\
          \"documentation\":\"<p>An optional maximum number of results returned in a single call.</p> <p>Default Value: <code>100</code> </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page.</p> <p>Default Value: <code>null</code> </p>\"\
        }\
      }\
    },\
    \"ListRouteCalculatorsRequestMaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListRouteCalculatorsResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Entries\"],\
      \"members\":{\
        \"Entries\":{\
          \"shape\":\"ListRouteCalculatorsResponseEntryList\",\
          \"documentation\":\"<p>Lists the route calculator resources that exist in your AWS account</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a subsequent request to fetch the next set of results.</p>\"\
        }\
      }\
    },\
    \"ListRouteCalculatorsResponseEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CalculatorName\",\
        \"CreateTime\",\
        \"DataSource\",\
        \"Description\",\
        \"PricingPlan\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CalculatorName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the route calculator resource.</p>\"\
        },\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp when the route calculator resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p> <ul> <li> <p>For example, <code>2020â07-2T12:15:20.000Z+01:00</code> </p> </li> </ul>\"\
        },\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The data provider of traffic and road network data. Indicates one of the available providers:</p> <ul> <li> <p> <code>Esri</code> </p> </li> <li> <p> <code>Here</code> </p> </li> </ul> <p>For more information about data providers, see <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html\\\">Amazon Location Service data providers</a>.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The optional description of the route calculator resource.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>The pricing plan for the specified route calculator resource.</p> <p>For additional details and restrictions on each pricing plan option, see <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing</a>.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp when the route calculator resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p> <ul> <li> <p>For example, <code>2020â07-2T12:15:20.000Z+01:00</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>A route calculator resource listed in your AWS account.</p>\"\
    },\
    \"ListRouteCalculatorsResponseEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListRouteCalculatorsResponseEntry\"}\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource whose tags you want to retrieve.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:resourcetype/ExampleResource</code> </p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceArn\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Tags that have been applied to the specified resource. Tags are mapped from the tag key to the tag value: <code>\\\"TagKey\\\" : \\\"TagValue\\\"</code>.</p> <ul> <li> <p>Format example: <code>{\\\"tag1\\\" : \\\"value1\\\", \\\"tag2\\\" : \\\"value2\\\"} </code> </p> </li> </ul>\"\
        }\
      }\
    },\
    \"ListTrackerConsumersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrackerName\"],\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListTrackerConsumersRequestMaxResultsInteger\",\
          \"documentation\":\"<p>An optional limit for the number of resources returned in a single call. </p> <p>Default value: <code>100</code> </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p> <p>Default value: <code>null</code> </p>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The tracker resource whose associated geofence collections you want to list.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"ListTrackerConsumersRequestMaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListTrackerConsumersResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"ConsumerArns\"],\
      \"members\":{\
        \"ConsumerArns\":{\
          \"shape\":\"ArnList\",\
          \"documentation\":\"<p>Contains the list of geofence collection ARNs associated to the tracker resource.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>\"\
        }\
      }\
    },\
    \"ListTrackersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"ListTrackersRequestMaxResultsInteger\",\
          \"documentation\":\"<p>An optional limit for the number of resources returned in a single call. </p> <p>Default value: <code>100</code> </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>The pagination token specifying which page of results to return in the response. If no token is provided, the default page is the first page. </p> <p>Default value: <code>null</code> </p>\"\
        }\
      }\
    },\
    \"ListTrackersRequestMaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"max\":100,\
      \"min\":1\
    },\
    \"ListTrackersResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\"Entries\"],\
      \"members\":{\
        \"Entries\":{\
          \"shape\":\"ListTrackersResponseEntryList\",\
          \"documentation\":\"<p>Contains tracker resources in your AWS account. Details include tracker name, description and timestamps for when the tracker was created and last updated.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"Token\",\
          \"documentation\":\"<p>A pagination token indicating there are additional pages available. You can use the token in a following request to fetch the next set of results. </p>\"\
        }\
      }\
    },\
    \"ListTrackersResponseEntry\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"Description\",\
        \"PricingPlan\",\
        \"TrackerName\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the tracker resource was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>The description for the tracker resource.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>The pricing plan for the specified tracker resource.</p> <p>For additional details and restrictions on each pricing plan option, see the <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing page</a>.</p>\"\
        },\
        \"PricingPlanDataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The specified data provider for the tracker resource.</p>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp at which the device's position was determined. Uses <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the tracker resource details.</p>\"\
    },\
    \"ListTrackersResponseEntryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ListTrackersResponseEntry\"}\
    },\
    \"MapConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"Style\"],\
      \"members\":{\
        \"Style\":{\
          \"shape\":\"MapStyle\",\
          \"documentation\":\"<p>Specifies the map style selected from an available data provider. For additional information on each map style and to preview each map style, see <a href=\\\"location/latest/developerguide/esri.html#esri-map-styles\\\">Esri map styles</a> and <a href=\\\"location/latest/developerguide/HERE.html#HERE-map-styles\\\">HERE map styles</a>.</p> <p>Valid <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/esri.html\\\">Esri</a> styles: </p> <ul> <li> <p> <code>VectorEsriDarkGrayCanvas</code> â The Esri Dark Gray Canvas map style. A vector basemap with a dark gray, neutral background with minimal colors, labels, and features that's designed to draw attention to your thematic content. </p> </li> <li> <p> <code>RasterEsriImagery</code> â The Esri Imagery map style. A raster basemap that provides one meter or better satellite and aerial imagery in many parts of the world and lower resolution satellite imagery worldwide. </p> </li> <li> <p> <code>VectorEsriLightGrayCanvas</code> â The Esri Light Gray Canvas map style, which provides a detailed vector basemap with a light gray, neutral background style with minimal colors, labels, and features that's designed to draw attention to your thematic content. </p> </li> <li> <p> <code>VectorEsriTopographic</code> â The Esri Light map style, which provides a detailed vector basemap with a classic Esri map style.</p> </li> <li> <p> <code>VectorEsriStreets</code> â The Esri World Streets map style, which provides a detailed vector basemap for the world symbolized with a classic Esri street map style. The vector tile layer is similar in content and style to the World Street Map raster map.</p> </li> <li> <p> <code>VectorEsriNavigation</code> â The Esri World Navigation map style, which provides a detailed basemap for the world symbolized with a custom navigation map style that's designed for use during the day in mobile devices.</p> </li> </ul> <p>Valid <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/HERE.html\\\">HERE Technologies</a> styles: </p> <ul> <li> <p> <code>VectorHereBerlin</code> â The HERE Berlin map style is a high contrast detailed base map of the world that blends 3D and 2D rendering.</p> <note> <p>When using HERE as your data provider, and selecting the Style <code>VectorHereBerlin</code>, you may not use HERE Technologies maps for Asset Management. See the <a href=\\\"https://aws.amazon.com/service-terms/\\\">AWS Service Terms</a> for Amazon Location Service.</p> </note> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the map tile style selected from an available provider.</p>\"\
    },\
    \"MapStyle\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"^[-._\\\\w]+$\"\
    },\
    \"Place\":{\
      \"type\":\"structure\",\
      \"required\":[\"Geometry\"],\
      \"members\":{\
        \"AddressNumber\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The numerical portion of an address, such as a building number. </p>\"\
        },\
        \"Country\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A country/region specified using <a href=\\\"https://www.iso.org/iso-3166-country-codes.html\\\">ISO 3166</a> 3-digit country/region code. For example, <code>CAN</code>.</p>\"\
        },\
        \"Geometry\":{\"shape\":\"PlaceGeometry\"},\
        \"Label\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The full name and address of the point of interest such as a city, region, or country. For example, <code>123 Any Street, Any Town, USA</code>.</p>\"\
        },\
        \"Municipality\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A name for a local area, such as a city or town name. For example, <code>Toronto</code>.</p>\"\
        },\
        \"Neighborhood\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of a community district. For example, <code>Downtown</code>.</p>\"\
        },\
        \"PostalCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A group of numbers and letters in a country-specific format, which accompanies the address for the purpose of identifying a location. </p>\"\
        },\
        \"Region\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A name for an area or geographical division, such as a province or state name. For example, <code>British Columbia</code>.</p>\"\
        },\
        \"Street\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name for a street or a road to identify a location. For example, <code>Main Street</code>.</p>\"\
        },\
        \"SubRegion\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A country, or an area that's part of a larger region . For example, <code>Metro Vancouver</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains details about addresses or points of interest that match the search criteria.</p>\"\
    },\
    \"PlaceGeometry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Point\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>A single point geometry specifies a location for a Place using <a href=\\\"https://gisgeography.com/wgs84-world-geodetic-system/\\\">WGS 84</a> coordinates:</p> <ul> <li> <p> <i>x</i> â Specifies the x coordinate or longitude. </p> </li> <li> <p> <i>y</i> â Specifies the y coordinate or latitude. </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Places uses a point geometry to specify a location or a Place.</p>\"\
    },\
    \"PlaceIndexSearchResultLimit\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"Position\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Double\"},\
      \"max\":2,\
      \"min\":2,\
      \"sensitive\":true\
    },\
    \"PricingPlan\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"RequestBasedUsage\",\
        \"MobileAssetTracking\",\
        \"MobileAssetManagement\"\
      ]\
    },\
    \"PutGeofenceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionName\",\
        \"GeofenceId\",\
        \"Geometry\"\
      ],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The geofence collection to store the geofence in.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>An identifier for the geofence. For example, <code>ExampleGeofence-1</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"GeofenceId\"\
        },\
        \"Geometry\":{\
          \"shape\":\"GeofenceGeometry\",\
          \"documentation\":\"<p>Contains the polygon details to specify the position of the geofence.</p> <note> <p>Each <a href=\\\"https://docs.aws.amazon.com/location-geofences/latest/APIReference/API_GeofenceGeometry.html\\\">geofence polygon</a> can have a maximum of 1,000 vertices.</p> </note>\"\
        }\
      }\
    },\
    \"PutGeofenceResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CreateTime\",\
        \"GeofenceId\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CreateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence was created in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        },\
        \"GeofenceId\":{\
          \"shape\":\"Id\",\
          \"documentation\":\"<p>The geofence identifier entered in the request.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the geofence was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      }\
    },\
    \"ResourceDescription\":{\
      \"type\":\"string\",\
      \"max\":1000,\
      \"min\":0\
    },\
    \"ResourceName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"^[-._\\\\w]+$\"\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>The resource that you've entered was not found in your AWS account.</p>\",\
      \"error\":{\
        \"httpStatusCode\":404,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"SearchForPositionResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"Place\"],\
      \"members\":{\
        \"Place\":{\
          \"shape\":\"Place\",\
          \"documentation\":\"<p>Contains details about the relevant point of interest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies a single point of interest, or Place as a result of a search query obtained from a dataset configured in the place index resource.</p>\"\
    },\
    \"SearchForPositionResultList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SearchForPositionResult\"}\
    },\
    \"SearchForTextResult\":{\
      \"type\":\"structure\",\
      \"required\":[\"Place\"],\
      \"members\":{\
        \"Place\":{\
          \"shape\":\"Place\",\
          \"documentation\":\"<p>Contains details about the relevant point of interest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains relevant Places returned by calling <code>SearchPlaceIndexForText</code>.</p>\"\
    },\
    \"SearchForTextResultList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SearchForTextResult\"}\
    },\
    \"SearchPlaceIndexForPositionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IndexName\",\
        \"Position\"\
      ],\
      \"members\":{\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the place index resource you want to use for the search.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IndexName\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PlaceIndexSearchResultLimit\",\
          \"documentation\":\"<p>An optional paramer. The maximum number of results returned per request. </p> <p>Default value: <code>50</code> </p>\"\
        },\
        \"Position\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>Specifies a coordinate for the query defined by a longitude, and latitude.</p> <ul> <li> <p>The first position is the X coordinate, or longitude.</p> </li> <li> <p>The second position is the Y coordinate, or latitude. </p> </li> </ul> <p>For example, <code>position=xLongitude&amp;position=yLatitude</code> .</p>\"\
        }\
      }\
    },\
    \"SearchPlaceIndexForPositionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Results\",\
        \"Summary\"\
      ],\
      \"members\":{\
        \"Results\":{\
          \"shape\":\"SearchForPositionResultList\",\
          \"documentation\":\"<p>Returns a list of Places closest to the specified position. Each result contains additional information about the Places returned.</p>\"\
        },\
        \"Summary\":{\
          \"shape\":\"SearchPlaceIndexForPositionSummary\",\
          \"documentation\":\"<p>Contains a summary of the request.</p>\"\
        }\
      }\
    },\
    \"SearchPlaceIndexForPositionSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSource\",\
        \"Position\"\
      ],\
      \"members\":{\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The data provider of geospatial data. Indicates one of the available providers:</p> <ul> <li> <p>Esri</p> </li> <li> <p>HERE</p> </li> </ul> <p>For additional details on data providers, see the <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html\\\">Amazon Location Service data providers page</a>.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PlaceIndexSearchResultLimit\",\
          \"documentation\":\"<p>An optional parameter. The maximum number of results returned per request. </p> <p>Default value: <code>50</code> </p>\"\
        },\
        \"Position\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The position given in the reverse geocoding request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A summary of the reverse geocoding request sent using <code>SearchPlaceIndexForPosition</code>.</p>\"\
    },\
    \"SearchPlaceIndexForTextRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IndexName\",\
        \"Text\"\
      ],\
      \"members\":{\
        \"BiasPosition\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>Searches for results closest to the given position. An optional parameter defined by longitude, and latitude.</p> <ul> <li> <p>The first <code>bias</code> position is the X coordinate, or longitude.</p> </li> <li> <p>The second <code>bias</code> position is the Y coordinate, or latitude. </p> </li> </ul> <p>For example, <code>bias=xLongitude&amp;bias=yLatitude</code>.</p>\"\
        },\
        \"FilterBBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Filters the results by returning only Places within the provided bounding box. An optional parameter.</p> <p>The first 2 <code>bbox</code> parameters describe the lower southwest corner:</p> <ul> <li> <p>The first <code>bbox</code> position is the X coordinate or longitude of the lower southwest corner.</p> </li> <li> <p>The second <code>bbox</code> position is the Y coordinate or latitude of the lower southwest corner.</p> </li> </ul> <p>For example, <code>bbox=xLongitudeSW&amp;bbox=yLatitudeSW</code>.</p> <p>The next <code>bbox</code> parameters describe the upper northeast corner:</p> <ul> <li> <p>The third <code>bbox</code> position is the X coordinate, or longitude of the upper northeast corner.</p> </li> <li> <p>The fourth <code>bbox</code> position is the Y coordinate, or longitude of the upper northeast corner.</p> </li> </ul> <p>For example, <code>bbox=xLongitudeNE&amp;bbox=yLatitudeNE</code> </p>\"\
        },\
        \"FilterCountries\":{\
          \"shape\":\"CountryCodeList\",\
          \"documentation\":\"<p>Limits the search to the given a list of countries/regions. An optional parameter.</p> <ul> <li> <p>Use the <a href=\\\"https://www.iso.org/iso-3166-country-codes.html\\\">ISO 3166</a> 3-digit country code. For example, Australia uses three upper-case characters: <code>AUS</code>.</p> </li> </ul>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the place index resource you want to use for the search.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IndexName\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PlaceIndexSearchResultLimit\",\
          \"documentation\":\"<p>An optional parameter. The maximum number of results returned per request. </p> <p>The default: <code>50</code> </p>\"\
        },\
        \"Text\":{\
          \"shape\":\"SyntheticSearchPlaceIndexForTextRequestString\",\
          \"documentation\":\"<p>The address, name, city, or region to be used in the search. In free-form text format. For example, <code>123 Any Street</code>.</p>\"\
        }\
      }\
    },\
    \"SearchPlaceIndexForTextResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Results\",\
        \"Summary\"\
      ],\
      \"members\":{\
        \"Results\":{\
          \"shape\":\"SearchForTextResultList\",\
          \"documentation\":\"<p>A list of Places closest to the specified position. Each result contains additional information about the specific point of interest. </p>\"\
        },\
        \"Summary\":{\
          \"shape\":\"SearchPlaceIndexForTextSummary\",\
          \"documentation\":\"<p>Contains a summary of the request. Contains the <code>BiasPosition</code>, <code>DataSource</code>, <code>FilterBBox</code>, <code>FilterCountries</code>, <code>MaxResults</code>, <code>ResultBBox</code>, and <code>Text</code>.</p>\"\
        }\
      }\
    },\
    \"SearchPlaceIndexForTextSummary\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DataSource\",\
        \"Text\"\
      ],\
      \"members\":{\
        \"BiasPosition\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>Contains the coordinates for the bias position entered in the geocoding request.</p>\"\
        },\
        \"DataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The data provider of geospatial data. Indicates one of the available providers:</p> <ul> <li> <p>Esri</p> </li> <li> <p>HERE</p> </li> </ul> <p>For additional details on data providers, see the <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/what-is-data-provider.html\\\">Amazon Location Service data providers page</a>.</p>\"\
        },\
        \"FilterBBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>Contains the coordinates for the optional bounding box coordinated entered in the geocoding request.</p>\"\
        },\
        \"FilterCountries\":{\
          \"shape\":\"CountryCodeList\",\
          \"documentation\":\"<p>Contains the country filter entered in the geocoding request.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"PlaceIndexSearchResultLimit\",\
          \"documentation\":\"<p>Contains the maximum number of results indicated for the request.</p>\"\
        },\
        \"ResultBBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>A bounding box that contains the search results within the specified area indicated by <code>FilterBBox</code>. A subset of bounding box specified using <code>FilterBBox</code>.</p>\"\
        },\
        \"Text\":{\
          \"shape\":\"SyntheticSearchPlaceIndexForTextSummaryString\",\
          \"documentation\":\"<p>The address, name, city or region to be used in the geocoding request. In free-form text format. For example, <code>Vancouver</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A summary of the geocoding request sent using <code>SearchPlaceIndexForText</code>.</p>\"\
    },\
    \"ServiceQuotaExceededException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A message with the reason for the service quota exceeded exception error.</p>\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>The operation was denied because the request would exceed the maximum <a href=\\\"https://docs.aws.amazon.com/location/latest/developerguide/location-quotas.html\\\">quota</a> set for Amazon Location Service.</p>\",\
      \"error\":{\
        \"httpStatusCode\":402,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"Step\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Distance\",\
        \"DurationSeconds\",\
        \"EndPosition\",\
        \"StartPosition\"\
      ],\
      \"members\":{\
        \"Distance\":{\
          \"shape\":\"StepDistanceDouble\",\
          \"documentation\":\"<p>The travel distance between the step's <code>StartPosition</code> and <code>EndPosition</code>.</p>\"\
        },\
        \"DurationSeconds\":{\
          \"shape\":\"StepDurationSecondsDouble\",\
          \"documentation\":\"<p>The estimated travel time, in seconds, from the step's <code>StartPosition</code> to the <code>EndPosition</code>. . The travel mode and departure time that you specify in the request determines the calculated time.</p>\"\
        },\
        \"EndPosition\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The end position of a step. If the position the last step in the leg, this position is the same as the end position of the leg.</p>\"\
        },\
        \"GeometryOffset\":{\
          \"shape\":\"StepGeometryOffsetInteger\",\
          \"documentation\":\"<p>Represents the start position, or index, in a sequence of steps within the leg's line string geometry. For example, the index of the first step in a leg geometry is <code>0</code>. </p> <p>Included in the response for queries that set <code>IncludeLegGeometry</code> to <code>True</code>. </p>\"\
        },\
        \"StartPosition\":{\
          \"shape\":\"Position\",\
          \"documentation\":\"<p>The starting position of a step. If the position is the first step in the leg, this position is the same as the start position of the leg.</p>\"\
        }\
      },\
      \"documentation\":\"<p> Represents an element of a leg within a route. A step contains instructions for how to move to the next step in the leg. </p>\"\
    },\
    \"StepDistanceDouble\":{\
      \"type\":\"double\",\
      \"box\":true,\
      \"min\":0\
    },\
    \"StepDurationSecondsDouble\":{\
      \"type\":\"double\",\
      \"box\":true,\
      \"min\":0\
    },\
    \"StepGeometryOffsetInteger\":{\
      \"type\":\"integer\",\
      \"box\":true,\
      \"min\":0\
    },\
    \"StepList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Step\"}\
    },\
    \"String\":{\"type\":\"string\"},\
    \"SyntheticSearchPlaceIndexForTextRequestString\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"SyntheticSearchPlaceIndexForTextSummaryString\":{\
      \"type\":\"string\",\
      \"sensitive\":true\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^(?!aws:)[a-zA-Z+-=._:/]+$\"\
    },\
    \"TagKeys\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagMap\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"},\
      \"max\":50,\
      \"min\":0\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource whose tags you want to update.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:resourcetype/ExampleResource</code> </p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceArn\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagMap\",\
          \"documentation\":\"<p>Tags that have been applied to the specified resource. Tags are mapped from the tag key to the tag value: <code>\\\"TagKey\\\" : \\\"TagValue\\\"</code>.</p> <ul> <li> <p>Format example: <code>{\\\"tag1\\\" : \\\"value1\\\", \\\"tag2\\\" : \\\"value2\\\"} </code> </p> </li> </ul>\"\
        }\
      }\
    },\
    \"TagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"^[A-Za-z0-9 _=@:.+-/]*$\"\
    },\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"required\":[\"Message\"],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"locationName\":\"message\"\
        }\
      },\
      \"documentation\":\"<p>The request was denied because of request throttling.</p>\",\
      \"error\":{\
        \"httpStatusCode\":429,\
        \"senderFault\":true\
      },\
      \"exception\":true,\
      \"retryable\":{\"throttling\":false}\
    },\
    \"Timestamp\":{\
      \"type\":\"timestamp\",\
      \"timestampFormat\":\"iso8601\"\
    },\
    \"Token\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1\
    },\
    \"TravelMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Car\",\
        \"Truck\",\
        \"Walking\"\
      ]\
    },\
    \"TruckDimensions\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Height\":{\
          \"shape\":\"TruckDimensionsHeightDouble\",\
          \"documentation\":\"<p>The height of the truck.</p> <ul> <li> <p>For example, <code>4.5</code>.</p> </li> </ul>\"\
        },\
        \"Length\":{\
          \"shape\":\"TruckDimensionsLengthDouble\",\
          \"documentation\":\"<p>The length of the truck.</p> <ul> <li> <p>For example, <code>15.5</code>.</p> </li> </ul>\"\
        },\
        \"Unit\":{\
          \"shape\":\"DimensionUnit\",\
          \"documentation\":\"<p> Specifies the unit of measurement for the truck dimensions.</p> <p>Default Value: <code>Meters</code> </p>\"\
        },\
        \"Width\":{\
          \"shape\":\"TruckDimensionsWidthDouble\",\
          \"documentation\":\"<p>The width of the truck.</p> <ul> <li> <p>For example, <code>4.5</code>.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Contains details about the truck dimensions in the unit of measurement that you specify. Used to filter out roads that can't support or allow the specified dimensions for requests that specify <code>TravelMode</code> as <code>Truck</code>.</p>\"\
    },\
    \"TruckDimensionsHeightDouble\":{\
      \"type\":\"double\",\
      \"box\":true,\
      \"min\":0\
    },\
    \"TruckDimensionsLengthDouble\":{\
      \"type\":\"double\",\
      \"box\":true,\
      \"min\":0\
    },\
    \"TruckDimensionsWidthDouble\":{\
      \"type\":\"double\",\
      \"box\":true,\
      \"min\":0\
    },\
    \"TruckWeight\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Total\":{\
          \"shape\":\"TruckWeightTotalDouble\",\
          \"documentation\":\"<p>The total weight of the truck. </p> <ul> <li> <p>For example, <code>3500</code>.</p> </li> </ul>\"\
        },\
        \"Unit\":{\
          \"shape\":\"VehicleWeightUnit\",\
          \"documentation\":\"<p>The unit of measurement to use for the truck weight.</p> <p>Default Value: <code>Kilograms</code> </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains details about the truck's weight specifications. Used to avoid roads that can't support or allow the total weight for requests that specify <code>TravelMode</code> as <code>Truck</code>.</p>\"\
    },\
    \"TruckWeightTotalDouble\":{\
      \"type\":\"double\",\
      \"box\":true,\
      \"min\":0\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the resource from which you want to remove tags.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:resourcetype/ExampleResource</code> </p> </li> </ul>\",\
          \"location\":\"uri\",\
          \"locationName\":\"ResourceArn\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeys\",\
          \"documentation\":\"<p>The list of tag keys to remove from the specified resource.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"tagKeys\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateGeofenceCollectionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CollectionName\"],\
      \"members\":{\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the geofence collection to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CollectionName\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>Updates the description for the geofence collection.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>Updates the pricing plan for the geofence collection.</p> <p>For more information about each pricing plan option restrictions, see <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing</a>.</p>\"\
        },\
        \"PricingPlanDataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Updates the data provider for the geofence collection. </p> <p>A required value for the following pricing plans: <code>MobileAssetTracking</code>| <code>MobileAssetManagement</code> </p> <p>For more information about <a href=\\\"https://aws.amazon.com/location/data-providers/\\\">data providers</a> and <a href=\\\"https://aws.amazon.com/location/pricing/\\\">pricing plans</a>, see the Amazon Location Service product page.</p> <note> <p>This can only be updated when updating the <code>PricingPlan</code> in the same request.</p> <p>Amazon Location Service uses <code>PricingPlanDataSource</code> to calculate billing for your geofence collection. Your data won't be shared with the data provider, and will remain in your AWS account and Region unless you move it.</p> </note>\"\
        }\
      }\
    },\
    \"UpdateGeofenceCollectionResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CollectionArn\",\
        \"CollectionName\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CollectionArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the updated geofence collection. Used to specify a resource across AWS.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:geofence-collection/ExampleGeofenceCollection</code> </p> </li> </ul>\"\
        },\
        \"CollectionName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the updated geofence collection.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time when the geofence collection was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\">ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code> </p>\"\
        }\
      }\
    },\
    \"UpdateMapRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"MapName\"],\
      \"members\":{\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>Updates the description for the map resource.</p>\"\
        },\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the map resource to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"MapName\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>Updates the pricing plan for the map resource.</p> <p>For more information about each pricing plan option restrictions, see <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateMapResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"MapArn\",\
        \"MapName\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"MapArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the updated map resource. Used to specify a resource across AWS.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:maps/ExampleMap</code> </p> </li> </ul>\"\
        },\
        \"MapName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the updated map resource.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the map resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      }\
    },\
    \"UpdatePlaceIndexRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"IndexName\"],\
      \"members\":{\
        \"DataSourceConfiguration\":{\
          \"shape\":\"DataSourceConfiguration\",\
          \"documentation\":\"<p>Updates the data storage option for the place index resource.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>Updates the description for the place index resource.</p>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the place index resource to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"IndexName\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>Updates the pricing plan for the place index resource.</p> <p>For more information about each pricing plan option restrictions, see <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing</a>.</p>\"\
        }\
      }\
    },\
    \"UpdatePlaceIndexResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"IndexArn\",\
        \"IndexName\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"IndexArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the upated place index resource. Used to specify a resource across AWS.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:place- index/ExamplePlaceIndex</code> </p> </li> </ul>\"\
        },\
        \"IndexName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the updated place index resource.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the place index resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      }\
    },\
    \"UpdateRouteCalculatorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"CalculatorName\"],\
      \"members\":{\
        \"CalculatorName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the route calculator resource to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"CalculatorName\"\
        },\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>Updates the description for the route calculator resource.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>Updates the pricing plan for the route calculator resource.</p> <p>For more information about each pricing plan option restrictions, see <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateRouteCalculatorResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"CalculatorArn\",\
        \"CalculatorName\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"CalculatorArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the updated route calculator resource. Used to specify a resource across AWS.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:route- calculator/ExampleCalculator</code> </p> </li> </ul>\"\
        },\
        \"CalculatorName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the updated route calculator resource.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the route calculator was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      }\
    },\
    \"UpdateTrackerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TrackerName\"],\
      \"members\":{\
        \"Description\":{\
          \"shape\":\"ResourceDescription\",\
          \"documentation\":\"<p>Updates the description for the tracker resource.</p>\"\
        },\
        \"PricingPlan\":{\
          \"shape\":\"PricingPlan\",\
          \"documentation\":\"<p>Updates the pricing plan for the tracker resource.</p> <p>For more information about each pricing plan option restrictions, see <a href=\\\"https://aws.amazon.com/location/pricing/\\\">Amazon Location Service pricing</a>.</p>\"\
        },\
        \"PricingPlanDataSource\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Updates the data provider for the tracker resource. </p> <p>A required value for the following pricing plans: <code>MobileAssetTracking</code>| <code>MobileAssetManagement</code> </p> <p>For more information about <a href=\\\"https://aws.amazon.com/location/data-providers/\\\">data providers</a> and <a href=\\\"https://aws.amazon.com/location/pricing/\\\">pricing plans</a>, see the Amazon Location Service product page</p> <note> <p>This can only be updated when updating the <code>PricingPlan</code> in the same request.</p> <p>Amazon Location Service uses <code>PricingPlanDataSource</code> to calculate billing for your tracker resource. Your data won't be shared with the data provider, and will remain in your AWS account and Region unless you move it.</p> </note>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the tracker resource to update.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"TrackerName\"\
        }\
      }\
    },\
    \"UpdateTrackerResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TrackerArn\",\
        \"TrackerName\",\
        \"UpdateTime\"\
      ],\
      \"members\":{\
        \"TrackerArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the updated tracker resource. Used to specify a resource across AWS.</p> <ul> <li> <p>Format example: <code>arn:aws:geo:region:account-id:tracker/ExampleTracker</code> </p> </li> </ul>\"\
        },\
        \"TrackerName\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the updated tracker resource.</p>\"\
        },\
        \"UpdateTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp for when the tracker resource was last updated in <a href=\\\"https://www.iso.org/iso-8601-date-and-time-format.html\\\"> ISO 8601</a> format: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>. </p>\"\
        }\
      }\
    },\
    \"ValidationException\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FieldList\",\
        \"Message\",\
        \"Reason\"\
      ],\
      \"members\":{\
        \"FieldList\":{\
          \"shape\":\"ValidationExceptionFieldList\",\
          \"documentation\":\"<p>The field where the invalid entry was detected.</p>\",\
          \"locationName\":\"fieldList\"\
        },\
        \"Message\":{\
          \"shape\":\"String\",\
          \"locationName\":\"message\"\
        },\
        \"Reason\":{\
          \"shape\":\"ValidationExceptionReason\",\
          \"documentation\":\"<p>A message with the reason for the validation exception error.</p>\",\
          \"locationName\":\"reason\"\
        }\
      },\
      \"documentation\":\"<p>The input failed to meet the constraints specified by the AWS service. </p>\",\
      \"error\":{\
        \"httpStatusCode\":400,\
        \"senderFault\":true\
      },\
      \"exception\":true\
    },\
    \"ValidationExceptionField\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Message\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"Message\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A message with the reason for the validation exception error.</p>\",\
          \"locationName\":\"message\"\
        },\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The field name where the invalid entry was detected.</p>\",\
          \"locationName\":\"name\"\
        }\
      },\
      \"documentation\":\"<p>The input failed to meet the constraints specified by the AWS service in a specified field. </p>\"\
    },\
    \"ValidationExceptionFieldList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ValidationExceptionField\"}\
    },\
    \"ValidationExceptionReason\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"UnknownOperation\",\
        \"Missing\",\
        \"CannotParse\",\
        \"FieldValidationFailed\",\
        \"Other\"\
      ]\
    },\
    \"VehicleWeightUnit\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Kilograms\",\
        \"Pounds\"\
      ]\
    }\
  },\
  \"documentation\":\"<p>Suite of geospatial services including Maps, Places, Routes, Tracking, and Geofencing</p>\"\
}\
";
}

@end
