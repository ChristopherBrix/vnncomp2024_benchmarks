wget https://rwth-aachen.sciebo.de/s/RapAoed1dxG1PMs/download -O large_models.zip
unzip large_models.zip -d large_models

echo "Moving large benchmark files"
cd large_models/vnncomp2024/
for d in *
do
    cd $d/seed_896832480/;
    mkdir -p ../../../../benchmarks/$d/onnx
    mkdir -p ../../../../benchmarks/$d/vnnlib
    find . -type f -exec mv "{}" "../../../../benchmarks/$d/{}" \;
    cd ../../;
done
cd ../..
rm -r large_models large_models.zip

echo "Unzipping"
gunzip benchmarks/*/onnx/* benchmarks/*/onnx/*/* benchmarks/*/vnnlib/* benchmarks/*/vnnlib/*/*
