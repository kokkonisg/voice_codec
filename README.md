# voice_codec
In this class project (Multimedia Systems) a voice encoder/decoder is implemented withbased on the ETSI GSM 06.10 standard using the Regular Pulse Excitation.

Its design is based in three hierarchical parts, the Short Term analysis, the Long Term analysis and the overall implementation of the decoder/encoder. For the imnplementation of the project, "Matlab" was used and the sound samples were taken from the website "[SIGNALogic](https://www.signalogic.com/index.pl?page=speech_codec_wav_samples)".\
A more detailed documentation of the project can be found on the file _[GSM_codec_9581_9511.pdf](GSM_codec_9581_9511.pdf)_ <sub>(it's in greek)</sub>.

## Part 1

In the first part of the project, the short-term analysis was implemented, which is carried out at frame level. In particular, the functions _RPE_frame_ST_coder_ and _RPE_frame_ST_decoder_ are used in the _Part1.m_ file where a set of samples of (male or female) voice are encoded and decoded. The samples are stored in .wav format with a sampling rate of 8000 Hz (male.wav & female.wav respectively).

## Part 2

In the second part of the project, the long-term analysis was implemented, which is performed at the subframe level. In particular, the functions _RPE_frame_SLT_coder_ and _RPE_frame_SLT_decoder_ are used in the _Part2.m_ file where a set of samples of (male or female) voice are encoded and decoded. The samples are stored in .wav format with a sampling rate of 8000 Hz (male.wav & female.wav respectively).

## Final Part
The same procedure is followed as in Part 2, except that the prediction error sequence is subsampled and the encoded information is encoded and stored in a single binary table, where each row corresponds to a frame. 

The final result, clearly has a lot of noise, as there is an error in the implementation of the subsampling and/or encoding of it.
