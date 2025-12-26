import { image } from "@kit.ImageKit";
import { resourceManager } from '@kit.LocalizationKit';
import { ContextUtil } from "../context/ContextUtil";
import { util } from "@kit.ArkTS";

export class ImageUtil {
  /**
   * 创建ImageSource实例
   * @param {string | number | ArrayBuffer | resourceManager.RawFileDescriptor} src 图片数据源
   *   {string} 当前应用沙箱的图片路径。
   *   {number} 文件描述符fd。
   *   {ArrayBuffer} 图像缓冲区数组。
   *   {resourceManager.RawFileDescriptor} rawfile图片文件所在hap的descriptor信息。
   * @param {image.SourceOptions} options 图片属性（像素密度、像素格式、图片尺寸等）。
   * @returns {image.ImageSource} 返回ImageSource实例。
   */
  private static createImageSource(src: string | number | ArrayBuffer | resourceManager.RawFileDescriptor, options?: image.SourceOptions): image.ImageSource {
    if (typeof src === 'string') {
      if (options) return image.createImageSource(src, options);
      return image.createImageSource(src);
    } else if (typeof src === 'number') {
      if (options) return image.createImageSource(src, options);
      return image.createImageSource(src);
    } else if (src instanceof ArrayBuffer) {
      if (options) return image.createImageSource(src, options);
      return image.createImageSource(src);
    } else {
      if (options) return image.createImageSource(src, options);
      return image.createImageSource(src);
    }
  }

  /**
   * 用户获取resource目录下的media中的图片PixelMap
   * @param {Resource} resource Resource资源信息
   * @param {image.DecodingOptions} options 图像解码参数
   * @returns {Promise<image.PixelMap>} 返回图像的PixelMap对象
   */
  static async getPixelMapFromResource(resource: Resource, options?: image.DecodingOptions): Promise<image.PixelMap> {
    const resManager: resourceManager.ResourceManager = ContextUtil.getUIAbilityCtx().resourceManager;
    const uint8Array: Uint8Array = resManager.getMediaContentSync(resource.id);
    return await ImageUtil.createImageSource(uint8Array.buffer).createPixelMap(options);
  }

  /**
   * 图片打包
   * @param {image.PixelMap} source 图像的PixelMap对象
   * @param {image.PackingOption} options 图像打包参数
   * @returns {Promise<ArrayBuffer>} ArrayBuffer 返回图像数据
   */
  static packingFromPixelMap(source: image.PixelMap, options: image.PackingOption): Promise<ArrayBuffer> {
    const imagePacker: image.ImagePacker = image.createImagePacker();
    return imagePacker.packToData(source, options).finally(() => {
      imagePacker.release();
    });
  }

  /**
   * PixelMap转base64
   * @param {image.PixelMap} pixelMap 图像的PixelMap对象
   * @param {string} format 目标格式（默认png，当前只支持jpg、webp和png）
   * @returns {Promise<string>} 返回图像的base64字符串
   */
  static async pixelMapToBase64(pixelMap: image.PixelMap, format: string = 'image/png'): Promise<string> {
    const options: image.PackingOption = { format: format, quality: 100 };
    const arrayBuffer: ArrayBuffer = await ImageUtil.packingFromPixelMap(pixelMap, options);
    const base64Helper: util.Base64Helper = new util.Base64Helper();
    const BASE64_DATA_HEAD: string = `data:${format};base64,`;
    let base64Str: string = base64Helper.encodeToStringSync(new Uint8Array(arrayBuffer));
    if (!base64Str.startsWith(BASE64_DATA_HEAD)) {
      base64Str = BASE64_DATA_HEAD + base64Str;
    }
    return base64Str;
  }

  /**
   * base64转PixelMap
   * @param {string} base64 图片base64字符串
   * @returns {Promise<image.PixelMap>} 返回图像的PixelMap对象
   */
  static async base64ToPixelMap(base64: string): Promise<image.PixelMap> {
    const reg: RegExp = new RegExp('data:image/\\w+;base64,');
    const base64Str: string = base64.replace(reg, '');
    const base64Helper: util.Base64Helper = new util.Base64Helper();
    const uint8Array: Uint8Array = base64Helper.decodeSync(base64Str);
    let imageSource: image.ImageSource = image.createImageSource(uint8Array.buffer);
    let options: image.DecodingOptions = { editable: false };
    return imageSource.createPixelMap(options);
  }


  /**
   * 生成压缩图片
   * @param {Resource | image.PixelMap} src 未压缩的Resource图片或PixelMap对象
   * @param {number} maxSize 图像大小限制，默认不超过2MB
   * @returns {Promise<image.PixelMap>} 返回压缩后的PixelMap对象
   */
  static async createCompressedPixelMap(src: Resource | image.PixelMap, maxSize: number = 2 * 1024 * 1024): Promise<image.PixelMap> {
    if (typeof (src as Resource).id == 'number') {
      src = await ImageUtil.getPixelMapFromResource((src as Resource));
    }
    const pixelMap = src as image.PixelMap;
    let pixelBytes = pixelMap.getPixelBytesNumber(); // 总字节数
    while (pixelBytes > maxSize) {
      await pixelMap.scale(0.7, 0.7, image.AntiAliasingLevel.LOW);
      pixelBytes = pixelMap.getPixelBytesNumber();
    }
    return pixelMap;
  }
}