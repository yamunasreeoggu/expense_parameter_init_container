for par in ${INPUT} ; do
  var=$(aws ssm get-parameter --name $(echo $par | awk -F , '{print $2}') --with-decryption --query 'Parameter.Value' --output text)
  echo export $(echo $par | awk -F , '{print $1}')=$var >>/config/params
done
