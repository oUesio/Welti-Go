from rest_framework import serializers
from django.db import transaction
from django.contrib.auth import get_user_model
from rest_framework.exceptions import ValidationError
from .models import Monster, TaskVerification

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = get_user_model()
        fields = ('id', 'username', 'first_name', 'last_name', 'email', 'password')

    @staticmethod
    def validate_username(value):
        """
        Makes sure to disregard case when checking usernames
        """
        try:
            user = get_user_model().objects.get_by_natural_key(value)
        except get_user_model().DoesNotExist:
            return value
        else:
            raise ValidationError("A user with that username already exists.")

    @staticmethod
    def validate_password(value):
        """
        Checks if the password entered by the user fulfils certain criteria
        """
        # Make sure password is not too short or too long
        if len(value) < 6:
            raise ValidationError('The password entered is too short.')
        if len(value) > 50:
            raise ValidationError('The password entered is too long.')
        
        # Make sure password contains at least one letter and one number
        if not any(char.isdigit() for char in value):
            raise ValidationError('Password must contain at least one number.')
        if not any(char.isalpha() for char in value):
            raise ValidationError('Password must contain at least one letter.')
            
        return value
    
    # @staticmethod
    # def validate_email(value):
    #     """
    #     Checks if the password entered by the user fulfils certain criteria
    #     """

    @transaction.atomic
    def create(self, validated_data):
        """
        Takes validated POST data and creates an api.User instance
        """
        password = validated_data.pop('password')

        instance = self.Meta.model(**validated_data)
        instance.set_password(password)
        instance.save()

        return instance

# class CollectionSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Collection
#         fields = ('user_id', 'type_id', 'obtained')

class MonsterSerializer(serializers.ModelSerializer):
    class Meta:
        model = Monster
        fields = ('id', 'user_id', 'type_id', 'obtained')

class TaskVerificationSerializer(serializers.Serializer):
    class Meta:
        model = TaskVerification
        fields = ('task_id', 'photo')