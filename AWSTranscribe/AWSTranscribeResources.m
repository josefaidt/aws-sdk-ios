//
// Copyright 2010-2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSTranscribeResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSTranscribeResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSTranscribeResources

+ (instancetype)sharedInstance {
    static AWSTranscribeResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSTranscribeResources new];
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
    \"apiVersion\":\"2017-10-26\",\
    \"endpointPrefix\":\"transcribe\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Transcribe Service\",\
    \"serviceId\":\"Transcribe\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"transcribe\",\
    \"targetPrefix\":\"Transcribe\",\
    \"uid\":\"transcribe-2017-10-26\"\
  },\
  \"operations\":{\
    \"CreateVocabulary\":{\
      \"name\":\"CreateVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVocabularyRequest\"},\
      \"output\":{\"shape\":\"CreateVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom vocabulary that you can use to change the way Amazon Transcribe handles transcription of an audio file. </p>\"\
    },\
    \"CreateVocabularyFilter\":{\
      \"name\":\"CreateVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateVocabularyFilterRequest\"},\
      \"output\":{\"shape\":\"CreateVocabularyFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates a new vocabulary filter that you can use to filter words, such as profane words, from the output of a transcription job.</p>\"\
    },\
    \"DeleteTranscriptionJob\":{\
      \"name\":\"DeleteTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteTranscriptionJobRequest\"},\
      \"errors\":[\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a previously submitted transcription job along with any other generated results such as the transcription, models, and so on.</p>\"\
    },\
    \"DeleteVocabulary\":{\
      \"name\":\"DeleteVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVocabularyRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes a vocabulary from Amazon Transcribe. </p>\"\
    },\
    \"DeleteVocabularyFilter\":{\
      \"name\":\"DeleteVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteVocabularyFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Removes a vocabulary filter.</p>\"\
    },\
    \"GetTranscriptionJob\":{\
      \"name\":\"GetTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"GetTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a transcription job. To see the status of the job, check the <code>TranscriptionJobStatus</code> field. If the status is <code>COMPLETED</code>, the job is finished and you can find the results at the location specified in the <code>TranscriptFileUri</code> field. If you enable content redaction, the redacted transcript appears in <code>RedactedTranscriptFileUri</code>.</p>\"\
    },\
    \"GetVocabulary\":{\
      \"name\":\"GetVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetVocabularyRequest\"},\
      \"output\":{\"shape\":\"GetVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Gets information about a vocabulary. </p>\"\
    },\
    \"GetVocabularyFilter\":{\
      \"name\":\"GetVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetVocabularyFilterRequest\"},\
      \"output\":{\"shape\":\"GetVocabularyFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"BadRequestException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a vocabulary filter.</p>\"\
    },\
    \"ListTranscriptionJobs\":{\
      \"name\":\"ListTranscriptionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTranscriptionJobsRequest\"},\
      \"output\":{\"shape\":\"ListTranscriptionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists transcription jobs with the specified status.</p>\"\
    },\
    \"ListVocabularies\":{\
      \"name\":\"ListVocabularies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListVocabulariesRequest\"},\
      \"output\":{\"shape\":\"ListVocabulariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of vocabularies that match the specified criteria. If no criteria are specified, returns the entire list of vocabularies.</p>\"\
    },\
    \"ListVocabularyFilters\":{\
      \"name\":\"ListVocabularyFilters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListVocabularyFiltersRequest\"},\
      \"output\":{\"shape\":\"ListVocabularyFiltersResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets information about vocabulary filters.</p>\"\
    },\
    \"StartTranscriptionJob\":{\
      \"name\":\"StartTranscriptionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartTranscriptionJobRequest\"},\
      \"output\":{\"shape\":\"StartTranscriptionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous job to transcribe speech to text. </p>\"\
    },\
    \"UpdateVocabulary\":{\
      \"name\":\"UpdateVocabulary\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateVocabularyRequest\"},\
      \"output\":{\"shape\":\"UpdateVocabularyResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Updates an existing vocabulary with new values. The <code>UpdateVocabulary</code> operation overwrites all of the existing information with the values that you provide in the request. </p>\"\
    },\
    \"UpdateVocabularyFilter\":{\
      \"name\":\"UpdateVocabularyFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateVocabularyFilterRequest\"},\
      \"output\":{\"shape\":\"UpdateVocabularyFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InternalFailureException\"},\
        {\"shape\":\"NotFoundException\"}\
      ],\
      \"documentation\":\"<p>Updates a vocabulary filter with a new list of filtered words.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"BadRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"FailureReason\"}\
      },\
      \"documentation\":\"<p>Your request didn't pass one or more validation tests. For example, if the transcription you're trying to delete doesn't exist or if it is in a non-terminal state (for example, it's \\\"in progress\\\"). See the exception <code>Message</code> field for more information.</p>\",\
      \"exception\":true\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>When you are using the <code>CreateVocabulary</code> operation, the <code>JobName</code> field is a duplicate of a previously entered job name. Resend your request with a different name.</p> <p>When you are using the <code>UpdateVocabulary</code> operation, there are two jobs running at the same time. Resend the second request later.</p>\",\
      \"exception\":true\
    },\
    \"ContentRedaction\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RedactionType\",\
        \"RedactionOutput\"\
      ],\
      \"members\":{\
        \"RedactionType\":{\
          \"shape\":\"RedactionType\",\
          \"documentation\":\"<p>Request parameter that defines the entities to be redacted. The only accepted value is <code>PII</code>.</p>\"\
        },\
        \"RedactionOutput\":{\
          \"shape\":\"RedactionOutput\",\
          \"documentation\":\"<p>Request parameter where you choose whether to output only the redacted transcript or generate an additional unredacted transcript.</p> <p>When you choose <code>redacted</code> Amazon Transcribe outputs a JSON file with only the redacted transcript and related information.</p> <p>When you choose <code>redacted_and_unredacted</code> Amazon Transcribe outputs a JSON file with the unredacted transcript and related information in addition to the JSON file with the redacted transcript.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Settings for content redaction within a transcription job.</p> <p>You can redact transcripts in US English (en-us). For more information see: <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/content-redaction.html\\\">Automatic Content Redaction</a> </p>\"\
    },\
    \"CreateVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyFilterName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The vocabulary filter name. The name must be unique within the account that contains it.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the words in the vocabulary filter. All words in the filter must be in the same language. The vocabulary filter can only be used with transcription jobs in the specified language.</p>\"\
        },\
        \"Words\":{\
          \"shape\":\"Words\",\
          \"documentation\":\"<p>The words to use in the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets\\\">Character Sets for Custom Vocabularies</a>.</p> <p>If you provide a list of words in the <code>Words</code> parameter, you can't use the <code>VocabularyFilterFileUri</code> parameter.</p>\"\
        },\
        \"VocabularyFilterFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of a text file used as input to create the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets\\\">Character Sets for Custom Vocabularies</a>.</p> <p>The specified file must be less than 50 KB of UTF-8 characters.</p> <p>If you provide the location of a list of words in the <code>VocabularyFilterFileUri</code> parameter, you can't use the <code>Words</code> parameter.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the words in the collection.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary filter was modified.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary. The name must be unique within an AWS account. The name is case-sensitive.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"Phrases\":{\
          \"shape\":\"Phrases\",\
          \"documentation\":\"<p>An array of strings that contains the vocabulary entries. </p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location of the text file that contains the definition of the custom vocabulary. The URI must be in the same region as the API endpoint that you are calling. The general form is </p> <p> <code> https://s3.&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code> </p> <p>For example:</p> <p> <code>https://s3.us-east-1.amazonaws.com/examplebucket/vocab.txt</code> </p> <p>For more information about S3 object names, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p> <p>For more information about custom vocabularies, see <a href=\\\"http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary\\\">Custom Vocabularies</a>.</p>\"\
        }\
      }\
    },\
    \"CreateVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. When the <code>VocabularyState</code> field contains <code>READY</code> the vocabulary is ready to be used in a <code>StartTranscriptionJob</code> request.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was created.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>VocabularyState</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>\"\
        }\
      }\
    },\
    \"DataAccessRoleArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"^arn:aws:iam::[0-9]{0,63}:role/[A-Za-z0-9:_/+=,@.-]{0,1023}$\"\
    },\
    \"DateTime\":{\"type\":\"timestamp\"},\
    \"DeleteTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TranscriptionJobName\"],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job to be deleted.</p>\"\
        }\
      }\
    },\
    \"DeleteVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyFilterName\"],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter to remove.</p>\"\
        }\
      }\
    },\
    \"DeleteVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to delete. </p>\"\
        }\
      }\
    },\
    \"FailureReason\":{\"type\":\"string\"},\
    \"GetTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TranscriptionJobName\"],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the job.</p>\"\
        }\
      }\
    },\
    \"GetTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJob\":{\
          \"shape\":\"TranscriptionJob\",\
          \"documentation\":\"<p>An object that contains the results of the transcription job.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyFilterName\"],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter for which to return information.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the words in the vocabulary filter.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the contents of the vocabulary filter were updated.</p>\"\
        },\
        \"DownloadUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The URI of the list of words in the vocabulary filter. You can use this URI to get the list of words.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyName\"],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to return information about. The name is case-sensitive.</p>\"\
        }\
      }\
    },\
    \"GetVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to return.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last modified.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>VocabularyState</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p>\"\
        },\
        \"DownloadUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location where the vocabulary is stored. Use this URI to get the contents of the vocabulary. The URI is available for a limited time.</p>\"\
        }\
      }\
    },\
    \"InternalFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>There was an internal error. Check the error message and try your request again.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"JobExecutionSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AllowDeferredExecution\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether a job should be queued by Amazon Transcribe when the concurrent execution limit is exceeded. When the <code>AllowDeferredExecution</code> field is true, jobs are queued and will be executed when the number of executing jobs falls below the concurrent execution limit. If the field is false, Amazon Transcribe returns a <code>LimitExceededException</code> exception.</p> <p>If you specify the <code>AllowDeferredExecution</code> field, you must specify the <code>DataAccessRoleArn</code> field.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"DataAccessRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of a role that has access to the S3 bucket that contains the input files. Amazon Transcribe will assume this role to read queued media files. If you have specified an output S3 bucket for the transcription results, this role should have access to the output bucket as well.</p> <p>If you specify the <code>AllowDeferredExecution</code> field, you must specify the <code>DataAccessRoleArn</code> field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about when a transcription job should be executed.</p>\"\
    },\
    \"KMSKeyId\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"^[A-Za-z0-9][A-Za-z0-9:_/+=,@.-]{0,2048}$\"\
    },\
    \"LanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"en-US\",\
        \"es-US\",\
        \"en-AU\",\
        \"fr-CA\",\
        \"en-GB\",\
        \"de-DE\",\
        \"pt-BR\",\
        \"fr-FR\",\
        \"it-IT\",\
        \"ko-KR\",\
        \"es-ES\",\
        \"en-IN\",\
        \"hi-IN\",\
        \"ar-SA\",\
        \"ru-RU\",\
        \"zh-CN\",\
        \"nl-NL\",\
        \"id-ID\",\
        \"ta-IN\",\
        \"fa-IR\",\
        \"en-IE\",\
        \"en-AB\",\
        \"en-WL\",\
        \"pt-PT\",\
        \"te-IN\",\
        \"tr-TR\",\
        \"de-CH\",\
        \"he-IL\",\
        \"ms-MY\",\
        \"ja-JP\",\
        \"ar-AE\"\
      ]\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Either you have sent too many requests or your input file is too long. Wait before you resend your request, or use a smaller file and resend the request.</p>\",\
      \"exception\":true\
    },\
    \"ListTranscriptionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>When specified, returns only transcription jobs with the specified status. Jobs are ordered by creation date, with the newest jobs returned first. If you donât specify a status, Amazon Transcribe returns all transcription jobs ordered by creation date. </p>\"\
        },\
        \"JobNameContains\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>When specified, the jobs returned in the list are limited to jobs whose name contains the specified string.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous request to <code>ListTranscriptionJobs</code> was truncated, include the <code>NextToken</code> to fetch the next set of jobs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of jobs to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>\"\
        }\
      }\
    },\
    \"ListTranscriptionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The requested status of the jobs returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListTranscriptionJobs</code> operation returns a page of jobs at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListTranscriptionJobs</code> operation to return in the next page of jobs.</p>\"\
        },\
        \"TranscriptionJobSummaries\":{\
          \"shape\":\"TranscriptionJobSummaries\",\
          \"documentation\":\"<p>A list of objects containing summary information for a transcription job.</p>\"\
        }\
      }\
    },\
    \"ListVocabulariesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous request to <code>ListVocabularies</code> was truncated, include the <code>NextToken</code> to fetch the next set of jobs.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of vocabularies to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>\"\
        },\
        \"StateEquals\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>When specified, only returns vocabularies with the <code>VocabularyState</code> field equal to the specified state.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>When specified, the vocabularies returned in the list are limited to vocabularies whose name contains the specified string. The search is case-insensitive, <code>ListVocabularies</code> will return both \\\"vocabularyname\\\" and \\\"VocabularyName\\\" in the response list.</p>\"\
        }\
      }\
    },\
    \"ListVocabulariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The requested vocabulary state.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListVocabularies</code> operation returns a page of vocabularies at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListVocabularies</code> operation to return in the next page of jobs.</p>\"\
        },\
        \"Vocabularies\":{\
          \"shape\":\"Vocabularies\",\
          \"documentation\":\"<p>A list of objects that describe the vocabularies that match the search criteria in the request.</p>\"\
        }\
      }\
    },\
    \"ListVocabularyFiltersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>If the result of the previous request to <code>ListVocabularyFilters</code> was truncated, include the <code>NextToken</code> to fetch the next set of collections.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of filters to return in the response. If there are fewer results in the list, this response contains only the actual results.</p>\"\
        },\
        \"NameContains\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>Filters the response so that it only contains vocabulary filters whose name contains the specified string.</p>\"\
        }\
      }\
    },\
    \"ListVocabularyFiltersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The <code>ListVocabularyFilters</code> operation returns a page of collections at a time. The maximum size of the page is set by the <code>MaxResults</code> parameter. If there are more jobs in the list than the page size, Amazon Transcribe returns the <code>NextPage</code> token. Include the token in the next request to the <code>ListVocabularyFilters</code> operation to return in the next page of jobs.</p>\"\
        },\
        \"VocabularyFilters\":{\
          \"shape\":\"VocabularyFilters\",\
          \"documentation\":\"<p>The list of vocabulary filters. It will contain at most <code>MaxResults</code> number of filters. If there are more filters, call the <code>ListVocabularyFilters</code> operation again with the <code>NextToken</code> parameter in the request set to the value of the <code>NextToken</code> field in the response.</p>\"\
        }\
      }\
    },\
    \"MaxAlternatives\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":2\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"MaxSpeakers\":{\
      \"type\":\"integer\",\
      \"max\":10,\
      \"min\":2\
    },\
    \"Media\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MediaFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 object location of the input media file. The URI must be in the same region as the API endpoint that you are calling. The general form is:</p> <p> <code> s3://&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code> </p> <p>For example:</p> <p> <code>s3://examplebucket/example.mp4</code> </p> <p> <code>s3://examplebucket/mediadocs/example.mp4</code> </p> <p>For more information about S3 object names, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the input media file in a transcription request.</p>\"\
    },\
    \"MediaFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"mp3\",\
        \"mp4\",\
        \"wav\",\
        \"flac\"\
      ]\
    },\
    \"MediaSampleRateHertz\":{\
      \"type\":\"integer\",\
      \"max\":48000,\
      \"min\":8000\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":8192,\
      \"pattern\":\".+\"\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>We can't find the requested resource. Check the name and try your request again.</p>\",\
      \"exception\":true\
    },\
    \"OutputBucketName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"pattern\":\"[a-z0-9][\\\\.\\\\-a-z0-9]{1,61}[a-z0-9]\"\
    },\
    \"OutputLocationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CUSTOMER_BUCKET\",\
        \"SERVICE_BUCKET\"\
      ]\
    },\
    \"Phrase\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\".+\"\
    },\
    \"Phrases\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Phrase\"}\
    },\
    \"RedactionOutput\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"redacted\",\
        \"redacted_and_unredacted\"\
      ]\
    },\
    \"RedactionType\":{\
      \"type\":\"string\",\
      \"enum\":[\"PII\"]\
    },\
    \"Settings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of a vocabulary to use when processing the transcription job.</p>\"\
        },\
        \"ShowSpeakerLabels\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Determines whether the transcription job uses speaker recognition to identify different speakers in the input audio. Speaker recognition labels individual speakers in the audio file. If you set the <code>ShowSpeakerLabels</code> field to true, you must also set the maximum number of speaker labels <code>MaxSpeakerLabels</code> field.</p> <p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>\"\
        },\
        \"MaxSpeakerLabels\":{\
          \"shape\":\"MaxSpeakers\",\
          \"documentation\":\"<p>The maximum number of speakers to identify in the input audio. If there are more speakers in the audio than this number, multiple speakers will be identified as a single speaker. If you specify the <code>MaxSpeakerLabels</code> field, you must set the <code>ShowSpeakerLabels</code> field to true.</p>\"\
        },\
        \"ChannelIdentification\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Instructs Amazon Transcribe to process each audio channel separately and then merge the transcription output of each channel into a single transcription. </p> <p>Amazon Transcribe also produces a transcription of each item detected on an audio channel, including the start time and end time of the item and alternative transcriptions of the item including the confidence that Amazon Transcribe has in the transcription.</p> <p>You can't set both <code>ShowSpeakerLabels</code> and <code>ChannelIdentification</code> in the same request. If you set both, your request returns a <code>BadRequestException</code>.</p>\"\
        },\
        \"ShowAlternatives\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Determines whether the transcription contains alternative transcriptions. If you set the <code>ShowAlternatives</code> field to true, you must also set the maximum number of alternatives to return in the <code>MaxAlternatives</code> field.</p>\"\
        },\
        \"MaxAlternatives\":{\
          \"shape\":\"MaxAlternatives\",\
          \"documentation\":\"<p>The number of alternative transcriptions that the service should return. If you specify the <code>MaxAlternatives</code> field, you must set the <code>ShowAlternatives</code> field to true.</p>\"\
        },\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter to use when transcribing the audio. The filter that you specify must have the same language code as the transcription job.</p>\"\
        },\
        \"VocabularyFilterMethod\":{\
          \"shape\":\"VocabularyFilterMethod\",\
          \"documentation\":\"<p>Set to <code>mask</code> to remove filtered text from the transcript and replace it with three asterisks (\\\"***\\\") as placeholder text. Set to <code>remove</code> to remove filtered text from the transcript without using placeholder text.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides optional settings for the <code>StartTranscriptionJob</code> operation.</p>\"\
    },\
    \"StartTranscriptionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TranscriptionJobName\",\
        \"LanguageCode\",\
        \"Media\"\
      ],\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the job. Note that you can't use the strings \\\".\\\" or \\\"..\\\" by themselves as the job name. The name must also be unique within an AWS account.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the language used in the input media file.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz, of the audio track in the input media file. </p> <p>If you do not specify the media sample rate, Amazon Transcribe determines the sample rate. If you specify the sample rate, it must match the sample rate detected by Amazon Transcribe. In most cases, you should leave the <code>MediaSampleRateHertz</code> field blank and let Amazon Transcribe determine the sample rate.</p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\
          \"shape\":\"Media\",\
          \"documentation\":\"<p>An object that describes the input media for a transcription job.</p>\"\
        },\
        \"OutputBucketName\":{\
          \"shape\":\"OutputBucketName\",\
          \"documentation\":\"<p>The location where the transcription is stored.</p> <p>If you set the <code>OutputBucketName</code>, Amazon Transcribe puts the transcript in the specified S3 bucket. When you call the <a>GetTranscriptionJob</a> operation, the operation returns this location in the <code>TranscriptFileUri</code> field. If you enable content redaction, the redacted transcript appears in <code>RedactedTranscriptFileUri</code>. If you enable content redaction and choose to output an unredacted transcript, that transcript's location still appears in the <code>TranscriptFileUri</code>. The S3 bucket must have permissions that allow Amazon Transcribe to put files in the bucket. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user\\\">Permissions Required for IAM User Roles</a>.</p> <p>You can specify an AWS Key Management Service (KMS) key to encrypt the output of your transcription using the <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side encryption of transcripts that are placed in your S3 bucket.</p> <p>If you don't set the <code>OutputBucketName</code>, Amazon Transcribe generates a pre-signed URL, a shareable URL that provides secure access to your transcription, and returns it in the <code>TranscriptFileUri</code> field. Use this URL to download the transcription.</p>\"\
        },\
        \"OutputEncryptionKMSKeyId\":{\
          \"shape\":\"KMSKeyId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key used to encrypt the output of the transcription job. The user calling the <code>StartTranscriptionJob</code> operation must have permission to use the specified KMS key.</p> <p>You can use either of the following to identify a KMS key in the current account:</p> <ul> <li> <p>KMS Key ID: \\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</p> </li> <li> <p>KMS Key Alias: \\\"alias/ExampleAlias\\\"</p> </li> </ul> <p>You can use either of the following to identify a KMS key in the current account or another account:</p> <ul> <li> <p>Amazon Resource Name (ARN) of a KMS Key: \\\"arn:aws:kms:region:account ID:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</p> </li> <li> <p>ARN of a KMS Key Alias: \\\"arn:aws:kms:region:account ID:alias/ExampleAlias\\\"</p> </li> </ul> <p>If you don't specify an encryption key, the output of the transcription job is encrypted with the default Amazon S3 key (SSE-S3). </p> <p>If you specify a KMS key to encrypt your output, you must also specify an output location in the <code>OutputBucketName</code> parameter.</p>\"\
        },\
        \"Settings\":{\
          \"shape\":\"Settings\",\
          \"documentation\":\"<p>A <code>Settings</code> object that provides optional settings for a transcription job.</p>\"\
        },\
        \"JobExecutionSettings\":{\
          \"shape\":\"JobExecutionSettings\",\
          \"documentation\":\"<p>Provides information about how a transcription job is executed. Use this field to indicate that the job can be queued for deferred execution if the concurrency limit is reached and there are no slots available to immediately run the job.</p>\"\
        },\
        \"ContentRedaction\":{\
          \"shape\":\"ContentRedaction\",\
          \"documentation\":\"<p>An object that contains the request parameters for content redaction.</p>\"\
        }\
      }\
    },\
    \"StartTranscriptionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJob\":{\
          \"shape\":\"TranscriptionJob\",\
          \"documentation\":\"<p>An object containing details of the asynchronous transcription job.</p>\"\
        }\
      }\
    },\
    \"String\":{\"type\":\"string\"},\
    \"Transcript\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 object location of the the transcript.</p> <p>Use this URI to access the transcript. If you specified an S3 bucket in the <code>OutputBucketName</code> field when you created the job, this is the URI of that bucket. If you chose to store the transcript in Amazon Transcribe, this is a shareable URL that provides secure access to that location.</p>\"\
        },\
        \"RedactedTranscriptFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 object location of the redacted transcript.</p> <p>Use this URI to access the redacated transcript. If you specified an S3 bucket in the <code>OutputBucketName</code> field when you created the job, this is the URI of that bucket. If you chose to store the transcript in Amazon Transcribe, this is a shareable URL that provides secure access to that location.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies the location of a transcription.</p>\"\
    },\
    \"TranscriptionJob\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The status of the transcription job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the input speech.</p>\"\
        },\
        \"MediaSampleRateHertz\":{\
          \"shape\":\"MediaSampleRateHertz\",\
          \"documentation\":\"<p>The sample rate, in Hertz, of the audio track in the input media file. </p>\"\
        },\
        \"MediaFormat\":{\
          \"shape\":\"MediaFormat\",\
          \"documentation\":\"<p>The format of the input media file.</p>\"\
        },\
        \"Media\":{\
          \"shape\":\"Media\",\
          \"documentation\":\"<p>An object that describes the input media for the transcription job.</p>\"\
        },\
        \"Transcript\":{\
          \"shape\":\"Transcript\",\
          \"documentation\":\"<p>An object that describes the output of the transcription job.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows with the job was started processing.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was created.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was completed.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, this field contains information about why the job failed.</p> <p>The <code>FailureReason</code> field can contain one of the following values:</p> <ul> <li> <p> <code>Unsupported media format</code> - The media format specified in the <code>MediaFormat</code> field of the request isn't valid. See the description of the <code>MediaFormat</code> field for a list of valid values.</p> </li> <li> <p> <code>The media format provided does not match the detected media format</code> - The media format of the audio file doesn't match the format specified in the <code>MediaFormat</code> field in the request. Check the media format of your media file and make sure that the two values match.</p> </li> <li> <p> <code>Invalid sample rate for audio file</code> - The sample rate specified in the <code>MediaSampleRateHertz</code> of the request isn't valid. The sample rate must be between 8000 and 48000 Hertz.</p> </li> <li> <p> <code>The sample rate provided does not match the detected sample rate</code> - The sample rate in the audio file doesn't match the sample rate specified in the <code>MediaSampleRateHertz</code> field in the request. Check the sample rate of your media file and make sure that the two values match.</p> </li> <li> <p> <code>Invalid file size: file size too large</code> - The size of your audio file is larger than Amazon Transcribe can process. For more information, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits\\\">Limits</a> in the <i>Amazon Transcribe Developer Guide</i>.</p> </li> <li> <p> <code>Invalid number of channels: number of channels too large</code> - Your audio contains more channels than Amazon Transcribe is configured to process. To request additional channels, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits-amazon-transcribe\\\">Amazon Transcribe Limits</a> in the <i>Amazon Web Services General Reference</i>.</p> </li> </ul>\"\
        },\
        \"Settings\":{\
          \"shape\":\"Settings\",\
          \"documentation\":\"<p>Optional settings for the transcription job. Use these settings to turn on speaker recognition, to set the maximum number of speakers that should be identified and to specify a custom vocabulary to use when processing the transcription job.</p>\"\
        },\
        \"JobExecutionSettings\":{\
          \"shape\":\"JobExecutionSettings\",\
          \"documentation\":\"<p>Provides information about how a transcription job is executed.</p>\"\
        },\
        \"ContentRedaction\":{\
          \"shape\":\"ContentRedaction\",\
          \"documentation\":\"<p>An object that describes content redaction settings for the transcription job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an asynchronous transcription job that was created with the <code>StartTranscriptionJob</code> operation. </p>\"\
    },\
    \"TranscriptionJobName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"TranscriptionJobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"QUEUED\",\
        \"IN_PROGRESS\",\
        \"FAILED\",\
        \"COMPLETED\"\
      ]\
    },\
    \"TranscriptionJobSummaries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TranscriptionJobSummary\"}\
    },\
    \"TranscriptionJobSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TranscriptionJobName\":{\
          \"shape\":\"TranscriptionJobName\",\
          \"documentation\":\"<p>The name of the transcription job.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was created.</p>\"\
        },\
        \"StartTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job started processing.</p>\"\
        },\
        \"CompletionTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>A timestamp that shows when the job was completed.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the input speech.</p>\"\
        },\
        \"TranscriptionJobStatus\":{\
          \"shape\":\"TranscriptionJobStatus\",\
          \"documentation\":\"<p>The status of the transcription job. When the status is <code>COMPLETED</code>, use the <code>GetTranscriptionJob</code> operation to get the results of the transcription.</p>\"\
        },\
        \"FailureReason\":{\
          \"shape\":\"FailureReason\",\
          \"documentation\":\"<p>If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, a description of the error.</p>\"\
        },\
        \"OutputLocationType\":{\
          \"shape\":\"OutputLocationType\",\
          \"documentation\":\"<p>Indicates the location of the output of the transcription job.</p> <p>If the value is <code>CUSTOMER_BUCKET</code> then the location is the S3 bucket specified in the <code>outputBucketName</code> field when the transcription job was started with the <code>StartTranscriptionJob</code> operation.</p> <p>If the value is <code>SERVICE_BUCKET</code> then the output is stored by Amazon Transcribe and can be retrieved using the URI in the <code>GetTranscriptionJob</code> response's <code>TranscriptFileUri</code> field.</p>\"\
        },\
        \"ContentRedaction\":{\
          \"shape\":\"ContentRedaction\",\
          \"documentation\":\"<p>The content redaction settings of the transcription job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides a summary of information about a transcription job.</p>\"\
    },\
    \"UpdateVocabularyFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"VocabularyFilterName\"],\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter to update.</p>\"\
        },\
        \"Words\":{\
          \"shape\":\"Words\",\
          \"documentation\":\"<p>The words to use in the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets\\\">Character Sets for Custom Vocabularies</a>.</p> <p>If you provide a list of words in the <code>Words</code> parameter, you can't use the <code>VocabularyFilterFileUri</code> parameter.</p>\"\
        },\
        \"VocabularyFilterFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of a text file used as input to create the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see <a href=\\\"https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets\\\">Character Sets for Custom Vocabularies</a>.</p> <p>The specified file must be less than 50 KB of UTF-8 characters.</p> <p>If you provide the location of a list of words in the <code>VocabularyFilterFileUri</code> parameter, you can't use the <code>Words</code> parameter.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the updated vocabulary filter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the words in the vocabulary filter.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary filter was updated.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"VocabularyName\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary to update. The name is case-sensitive.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"Phrases\":{\
          \"shape\":\"Phrases\",\
          \"documentation\":\"<p>An array of strings containing the vocabulary entries.</p>\"\
        },\
        \"VocabularyFileUri\":{\
          \"shape\":\"Uri\",\
          \"documentation\":\"<p>The S3 location of the text file that contains the definition of the custom vocabulary. The URI must be in the same region as the API endpoint that you are calling. The general form is </p> <p> <code> https://s3.&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt; </code> </p> <p>For example:</p> <p> <code>https://s3.us-east-1.amazonaws.com/examplebucket/vocab.txt</code> </p> <p>For more information about S3 object names, see <a href=\\\"http://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys\\\">Object Keys</a> in the <i>Amazon S3 Developer Guide</i>.</p> <p>For more information about custom vocabularies, see <a href=\\\"http://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary\\\">Custom Vocabularies</a>.</p>\"\
        }\
      }\
    },\
    \"UpdateVocabularyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary that was updated.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was updated.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. When the <code>VocabularyState</code> field contains <code>READY</code> the vocabulary is ready to be used in a <code>StartTranscriptionJob</code> request.</p>\"\
        }\
      }\
    },\
    \"Uri\":{\
      \"type\":\"string\",\
      \"max\":2000,\
      \"min\":1,\
      \"pattern\":\"(s3://|http(s*)://).+\"\
    },\
    \"Vocabularies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VocabularyInfo\"}\
    },\
    \"VocabularyFilterInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyFilterName\":{\
          \"shape\":\"VocabularyFilterName\",\
          \"documentation\":\"<p>The name of the vocabulary filter. The name must be unique in the account that holds the filter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the words in the vocabulary filter.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last updated.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a vocabulary filter.</p>\"\
    },\
    \"VocabularyFilterMethod\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"remove\",\
        \"mask\"\
      ]\
    },\
    \"VocabularyFilterName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"VocabularyFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"VocabularyFilterInfo\"}\
    },\
    \"VocabularyInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"VocabularyName\":{\
          \"shape\":\"VocabularyName\",\
          \"documentation\":\"<p>The name of the vocabulary.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the vocabulary entries.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"DateTime\",\
          \"documentation\":\"<p>The date and time that the vocabulary was last modified.</p>\"\
        },\
        \"VocabularyState\":{\
          \"shape\":\"VocabularyState\",\
          \"documentation\":\"<p>The processing state of the vocabulary. If the state is <code>READY</code> you can use the vocabulary in a <code>StartTranscriptionJob</code> request.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a custom vocabulary. </p>\"\
    },\
    \"VocabularyName\":{\
      \"type\":\"string\",\
      \"max\":200,\
      \"min\":1,\
      \"pattern\":\"^[0-9a-zA-Z._-]+\"\
    },\
    \"VocabularyState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PENDING\",\
        \"READY\",\
        \"FAILED\"\
      ]\
    },\
    \"Word\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1\
    },\
    \"Words\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Word\"},\
      \"min\":1\
    }\
  },\
  \"documentation\":\"<p>Operations and objects for transcribing speech to text.</p>\"\
}\
";
}

@end