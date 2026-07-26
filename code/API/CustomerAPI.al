page 90108 CustomerAPI
{
    PageType = API;
    APIPublisher = 'cloudfronts';
    APIGroup = 'training';
    APIVersion = 'v1.0';

    EntityName = 'customer';
    EntitySetName = 'customers';

    SourceTable = Customer;

    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                }

                field(number; Rec."No.")
                {
                }

                field(name; Rec.Name)
                {
                }

                field(city; Rec.City)
                {
                }

                field(phoneNumber; Rec."Phone No.")
                {
                }
            }
        }
    }
}