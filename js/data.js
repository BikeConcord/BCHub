var data = {
  tasks: [
    {
      task_id: 1,
      user_id: null,
      name: "Bike Concord",
      timestamp_due: null,
      completion_status: 0,
      privacy_status: 0,
      deletion_status: 0,
      sub_tasks: [
        {
          task_id: 2,
          user_id: 3,
          name: "Advocacy",
          timestamp_due: null,
          completion_status: 0,
          privacy_status: 0,
          deletion_status: 0,
          sub_tasks: [
            {
              task_id: 98,
              user_id: 3,
              name: "Contra Costa County",
              timestamp_due: null,
              completion_status: 0,
              privacy_status: 0,
              deletion_status: 0,
              sub_tasks: [
                {
                  task_id: 102,
                  user_id: 3,
                  name: "SR-242 ramps project",
                  timestamp_due: null,
                  completion_status: 0,
                  privacy_status: 0,
                  deletion_status: 0,
                  sub_tasks: []
                }
              ]
            },
            {
              task_id: 99,
              user_id: 3,
              name: "City of Concord",
              timestamp_due: null,
              completion_status: 0,
              privacy_status: 0,
              deletion_status: 0,
              sub_tasks: [
                {
                  task_id: 150,
                  user_id: 3,
                  name: "BPAC",
                  timestamp_due: null,
                  completion_status: 0,
                  privacy_status: 0,
                  deletion_status: 0,
                  sub_tasks: [
                    {
                      task_id: 151,
                      user_id: 3,
                      name: "Prepare for 2017-01-10 Council meeting",
                      timestamp_due: null,
                      completion_status: 1,
                      privacy_status: 0,
                      deletion_status: 0,
                      sub_tasks: [
                        {
                          task_id: 152,
                          user_id: 3,
                          name: "Position letter",
                          timestamp_due: null,
                          completion_status: 1,
                          privacy_status: 0,
                          deletion_status: 0,
                          sub_tasks: []
                        }
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          task_id: 3,
          user_id: 2,
          name: "Bike Works",
          timestamp_due: null,
          completion_status: 0,
          privacy_status: 0,
          deletion_status: 0,
          sub_tasks: [
            {
              task_id: 6,
              user_id: 2,
              name: "Bike Tent",
              timestamp_due: null,
              completion_status: 0,
              privacy_status: 0,
              deletion_status: 0,
              sub_tasks: []
            },
            {
              task_id: 5,
              user_id: 2,
              name: "Community Bicycle Shop",
              timestamp_due: null,
              completion_status: 0,
              privacy_status: 0,
              deletion_status: 0,
              sub_tasks: [
                {
                  task_id: 19,
                  user_id: 2,
                  name: "Secure a starting location for CBS",
                  timestamp_due: null,
                  completion_status: 0,
                  privacy_status: 0,
                  deletion_status: 0,
                  sub_tasks: []
                }
              ]
            }
          ]
        },
        {
          task_id: 4,
          user_id: 1,
          name: "Wrench Raising",
          timestamp_due: null,
          completion_status: 0,
          privacy_status: 0,
          deletion_status: 0,
          sub_tasks: []
        }
      ]
    },
  ],
  people: [
  ],
  peopleGroups: [
  ]
};

function task(task_id, user_id, name, timestamp_due, completion_status, privacy_status, deletion_status) {
    this.task_id = task_id;
    this.user_id = user_id;
    this.name = name;
    this.timestamp_due = timestamp_due;
    this.completion_status = completion_status;
    this.privacy_status = privacy_status;
    this.deletion_status = deletion_status;
}