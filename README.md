# Fake Display Resolution

this is a helper for tweek your mac display settings.

## installation

```sh
$ git clone https://github.com/htsign/FakeDisplayResolution.git
$ cd FakeDisplayResolution
$ git checkout develop
```

## usage

```sh
$ ./main.rb path
> /System/Library/Displays/Contents/Resources/Overrides/DisplayVendorID-***/DisplayProductID-****

$ ./main.rb list
> 1280 x  720
> 1152 x  648
> 1152 x  720
> 1024 x  768
> 1024 x  640
>  800 x  600
>  800 x  500
>  640 x  480
>  720 x  480

$ ./main.rb rawlist
> [0, 1280, 0, 720, 0, 0, 0, 1, nil, nil, nil, nil]
> [0, 1152, 0, 648, 0, 0, 0, 1, nil, nil, nil, nil]
> [0, 1152, 0, 720, 0, 0, 0, 1, nil, nil, nil, nil]
> [0, 1024, 0, 768, 0, 0, 0, 1, nil, nil, nil, nil]
> [0, 1024, 0, 640, 0, 0, 0, 1, nil, nil, nil, nil]
> [0, 800, 0, 600, 0, 0, 0, 1, nil, nil, nil, nil]
> [0, 800, 0, 500, 0, 0, 0, 1, nil, nil, nil, nil]
> [0, 640, 0, 480, 0, 0, 0, 1, nil, nil, nil, nil]
> [0, 720, 0, 480, 0, 0, 0, 1, nil, nil, nil, nil]

$ ./main.rb encode 1600 900
> AAAGQAAAA4QAAAAB

$ ./main.rb open
> # open your finder and select target plist file.
```

