package live.hms.hmssdk_flutter

import live.hms.video.sdk.models.HMSMessage
import live.hms.video.sdk.models.HMSPeer

class HMSMessageExtension {
    companion object{
        fun toDictionary(message:HMSMessage):HashMap<String,Any>{
            val args=HashMap<String,Any>()
            args.put("message",message.message)
            args.put("time",message.time.toLocaleString())
            args.put("type",message.type)
            args.put("sender",message.sender.name)

            val messageArgs=HashMap<String,Any>()
            messageArgs.put("message",args)
            return messageArgs
        }
    }
}