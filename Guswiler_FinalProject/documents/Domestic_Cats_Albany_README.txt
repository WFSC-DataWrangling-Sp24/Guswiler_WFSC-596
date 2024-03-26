README

This data file is published by the Movebank Data Repository (www.datarepository.movebank.org). As of the time of publication, a version of this published animal tracking dataset can be viewed on Movebank (www.movebank.org) in the study "Domestic Cats in the Albany Pine Bush, New York" (Movebank Study ID 3615655). Individual attributes in the data files are defined below, in the NERC Vocabulary Server at http://vocab.nerc.ac.uk/collection/MVB and in the Movebank Attribute Dictionary at www.movebank.org/cms/movebank-content/movebank-attribute-dictionary. Metadata describing this data package are maintained at https://datacite.org.

This data package includes the following data files:
Domestic Cats in the Albany Pine Bush New York.csv
Domestic Cats in the Albany Pine Bush New York-reference-data.csv

Data package citation:
Kays R, DeWan AA (2020) Data from: Ecological impact of inside/outside house cats around a suburban nature preserve. Movebank Data Repository. https://doi.org/10.5441/001/1.s6t84pb5

These data are described in the following written publication:
Kays RW and DeWan AA (2004) Ecological impact of inside/outside house cats around a suburban nature preserve. Animal Conservation 7(3): 273-283. https://doi.org/10.1017/S1367943004001489

-----------

Terms of Use
This data file is licensed by the Creative Commons Zero (CC0 1.0) license. The intent of this license is to facilitate the re-use of works. The Creative Commons Zero license is a "no rights reserved" license that allows copyright holders to opt out of copyright protections automatically extended by copyright and other laws, thus placing works in the public domain with as little legal restriction as possible. However, works published with this license must still be appropriately cited following professional and ethical standards for academic citation.

We highly recommend that you contact the data creator if possible if you will be re-using or re-analyzing data in this file. Researchers will likely be interested in learning about new uses of their data, might also have important insights about how to properly analyze and interpret their data, and/or might have additional data they would be willing to contribute to your project. Feel free to contact us at support@movebank.org if you need assistance contacting data owners.

For additional information, see

License description: http://creativecommons.org/publicdomain/zero/1.0

General Movebank Terms of Use: www.movebank.org/cms/movebank-content/general-movebank-terms-of-use

Movebank user agreement: https://www.movebank.org/cms/movebank-content/data-policy#user_agreement

-----------

Data Attributes
These definitions come from the Movebank Attribute Dictionary, available at http://vocab.nerc.ac.uk/collection/MVB and www.movebank.org/node/2381.

animal comments: Additional information about the animal that is not described by other reference data terms.
example: sibling of #1423
units: none
entity described: individual

animal ID: An individual identifier for the animal, provided by the data owner. If the data owner does not provide an Animal ID, an internal Movebank animal identifier is sometimes shown. 
example: 91876A, Gary
units: none
entity described: individual
same as: individual local identifier

animal life stage: The age class or life stage of the animal at the beginning of the deployment. Can be years or months of age or terms such as 'adult', 'subadult' and 'juvenile'. Best practice is to define units in the values if needed (e.g. '2 years').
example: juvenile, adult
units: not defined
entity described: deployment

animal reproductive condition: The reproductive condition of the animal at the beginning of the deployment.
example: lactating
units: none
entity described: deployment

animal sex: The sex of the animal. Allowed values are 
m = male
f = female
format: controlled list
entity described: individual

animal taxon: The scientific name of the species on which the tag was deployed, as defined by the Integrated Taxonomic Information System (ITIS, www.itis.gov). If the species name can not be provided, this should be the lowest level taxonomic rank that can be determined and that is used in the ITIS taxonomy. Additional information can be provided using the term 'taxon detail'. 
example: Buteo swainsoni
format: controlled list
entity described: individual
same as: individual taxon canonical name

attachment type: The way a tag is attached to an animal. Values are chosen from a controlled list: 
collar = The tag is attached by a collar around the animal's neck
glue = The tag is attached to the animal using glue
harness = The tag is attached to the animal using a harness
implant = The tag is placed under the skin of the animal
tape = The tag is attached to the animal using tape
other = user specified 
format: controlled list
entity described: deployment

behavioural classification: Behavioural classifications assigned to the animal by the data owner. The method for defining and assigning these classifications are unique to the study and can be described using 'behaviour according to'. Recommended best practice is to use a controlled list.
example: roosting, foraging, running
units: none
entity described: event

comments: Additional information about events that is not described by other event data terms.
example: we observed the animal foraging (see photo BT25)
units: none
entity described: event
THIS DATASET: Values contain whether where recorded and additional comments, including prey type where recorded if behavioural-classification includes "hunt".

deploy off timestamp: The timestamp when the tag deployment ended. 
example: 2009-10-01 12:00:00.000
format: yyyy-MM-dd HH:mm:ss.SSS
units: UTC or GPS time
entity described: deployment
same as: deploy off date

deploy on timestamp: The timestamp when the tag deployment started. 
example: 2008-08-30 18:00:00.000 
format: yyyy-MM-dd HH:mm:ss.SSS 
units: UTC or GPS time
entity described: deployment
same as: deploy on date

deployment ID: A unique identifier for the deployment of a tag on animal, provided by the data owner. If the data owner does not provide a Deployment ID, an internal Movebank deployment identifier may sometimes be shown. 
example: Jane-Tag42 
units: none 
entity described: deployment

event ID: An identifier for the set of values associated with each event, i.e. sensor measurement. A unique event ID is assigned to every time-location or other time-measurement record in Movebank. If multiple measurements are included within a single row of a data file, they will share an event ID. If users import the same sensor measurement to Movebank multiple times, a separate event ID will be assigned to each. 
example: 6340565
units: none
entity described: event

location lat: The geographic longitude of the location as estimated by the sensor. Positive values are east of the Greenwich Meridian, negative values are west of it. example: -41.0982423 
units: decimal degrees, WGS84 reference system 
entity described: event

location long: The geographic longitude of the location as estimated by the sensor. Positive values are east of the Greenwich Meridian, negative values are west of it. 
example: -121.1761111 
units: decimal degrees, WGS84 reference system 
entity described: event

manipulation type: The way in which the animal was manipulated during the deployment. Values are chosen from a controlled list: 
confined = The animal's movement was restricted to within a defined area
none = The animal received no treatment other than the tag attachment
relocated = The animal was released from a site other than the one at which it was captured
manipulated other = The animal was manipulated in some other way, such as a physiological manipulation. 
format: controlled list 
entity described: deployment

sensor type: The type of sensor with which data were collected. All sensors are associated with a tag id, and tags can contain multiple sensor types. Each event record in Movebank is assigned one sensor type. If values from multiple sensors are reported in a single event, the primary sensor is used. Values are chosen from a controlled list: 
acceleration = The sensor collects acceleration data
accessory measurements = The sensor collects accessory measurements, such as battery voltage
Argos Doppler shift = The sensor uses Argos Doppler shift to determine position
barometer = The sensor records air or water pressure
bird ring = The animal is identified by a band or ring that has a unique identifier
GPS = The sensor uses GPS to determine location
magnetometer = The sensor records the magnetic field
natural mark = The animal is identified by a unique natural marking
orientation = Quaternion components describing the orientation of the tag are derived from accelerometer and gyroscope measurements
radio transmitter = The sensor is a classical radio transmitter
solar geolocator = The sensor collects light levels, which are used to determine position (for processed locations)
solar geolocator raw = The sensor collects light levels, which are used to determine position (for raw light-level measurements)
solar geolocator twilight = The sensor collects light levels, which are used to determine position (for twilights calculated from light-level measurements). 
format: controlled list
entity described: event

study name: The name of the study in Movebank. 
example: Coyotes, Kays and Bogan, Albany NY
units: none
entity described: study, event

study site: A location such as the deployment site or colony, or a location-related group such as the herd or pack name.
example: Pickerel Island North
units: none
entity described: deployment

tag ID: A unique identifier for the tag, provided by the data owner. If the data owner does not provide a tag ID, an internal Movebank tag identifier may sometimes be shown. example: 2342 
units: none 
entity described: tag
same as: tag local identifier

tag manufacturer name: The company or person that produced the tag. 
example: Holohil
units: none
entity described: tag

tag readout method: The way the data are received from the tag. Values are chosen from a controlled list: 
satellite = Data are transferred via satellite 
phone network = Data are transferred via a phone network, such as GSM or AMPS
other wireless = Data are transferred via another form of wireless data transfer, such as a VHF transmitter/receiver
tag retrieval = The tag must be physically retrieved in order to obtain the data.
format: controlled list
entity described: deployment

timestamp: The date and time corresponding to a sensor measurement or an estimate derived from sensor measurements. 
example: 2008-08-14 18:31:00.000 
format: yyyy-MM-dd HH:mm:ss.SSS 
units: UTC or GPS time 
entity described: event

visible: Determines whether an event is visible on the Movebank map. Values are calculated automatically, with TRUE indicating the event has not been flagged as an outlier by 'algorithm marked outlier', 'import marked outlier' or 'manually marked outlier', or that the user has overridden the results of these outlier attributes using 'manually marked valid' = TRUE. Allowed values are TRUE or FALSE. 
units: none 
entity described: event

-----------

More Information
For more information about this repository, see www.movebank.org/cms/movebank-content/data-repository, the FAQ at www.movebank.org/cms/movebank-content/data-repository-faq, or contact us at support@movebank.org.