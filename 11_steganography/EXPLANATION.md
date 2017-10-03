# Steganography

Steganography for one channel

1. The first thing to do is read two images, the first will be the cover image and the second will be the secret image:

```matlab
cover_image  = imread('image1.jpg');
secret_image = imread('image2.jpg');
```

2. The next step is to extract one of the three color channels of each image, in this case we will work with the red channel:

```matlab
cover_red_channel  = cover_image(:, :, 1);
secret_red_channel = secret_image(:, :, 1);
```

Each pixel is conformed of eight bits (1 byte). Each byte of the image is a pixel and indicates the gray color (or in this case the red color) of the picture. The bits in the byte are arranged from the most significant bit ...(MSB)... to the least significant bit(LSB). That means MSB value is 128, whereas LBS bit value is 1. 

3. We need to extract each of the bits from the channel, from the MSB to the LSB:

```matlab
cover_bit7 = bitand(cover_red_channel, 128);
cover_bit6 = bitand(cover_red_channel, 64);
cover_bit5 = bitand(cover_red_channel, 32);
cover_bit4 = bitand(cover_red_channel, 16);
cover_bit3 = bitand(cover_red_channel, 8);
cover_bit2 = bitand(cover_red_channel, 4);
cover_bit1 = bitand(cover_red_channel, 2);
cover_bit0 = bitand(cover_red_channel, 1);
```

Visually each bit from the first image looks like the following, from the MSB to the LSB:

As we can see the first 5 bits are the most important, and the last 3 are mostly noise.

![](https://s20.postimg.org/8ailtrub1/cover_image_bits.png)

4. We do the same for the second image:

```matlab
cover_bit7 = bitand(secret_red_channel, 128);
cover_bit6 = bitand(secret_red_channel, 64);
cover_bit5 = bitand(secret_red_channel, 32);
cover_bit4 = bitand(secret_red_channel, 16);
cover_bit3 = bitand(secret_red_channel, 8);
cover_bit2 = bitand(secret_red_channel, 4);
cover_bit1 = bitand(secret_red_channel, 2);
cover_bit0 = bitand(secret_red_channel, 1);
```

Visually each bit from the second image looks like the following:

As we can see the first 4 bits are the most important, and the last 4 are mostly noise.

![](https://s20.postimg.org/6jzksacrx/secret_image_bits.png)


5. Next we compose a new image using a portion of bits from the first image and another portion from the second image, for example we can take 5 of the MSB from first image and 3 of the MSB from the second image, to make a total of 8:

As we are taking 3 of the MSB from the second image, we need to reduce the significance of those bits in order to preserve the cover image, this process is reversed on decryption, we increase the significance of those 3 bits to restore the secret image.

```matlab
result_image = cover_bit7 + cover_bit6 + cover_bit5 + cover_bit4 + cover_bit3 + (secret_bit2 / 32) + (secret_bit1 / 32) + (secret_bit0 / 32);
```

If we plot the images they will look like the following:

The encryption process is displayed in the first row and the decryption process is displayed in the second row.
![](https://s20.postimg.org/ee06dokkt/result_image.png)